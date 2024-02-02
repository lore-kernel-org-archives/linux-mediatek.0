Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1EBC4828D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 00:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kw5yCa7B5h6E5tqNELeCv4fqCVbEaQWT1fjUMOqoUrY=; b=cnRbu3Kdj+lkHdGUtvnBTpuMN2
	y+OLZ9s/w6uqLjvK+qYYC01aNMKWhJZ2RxWAyF2tBA98sjqQI9SRJd3XF9ytXZIBixVXVAWbYA74h
	VgYLW2XhXb59Ev1aJPVsm/b7rtRQxHrh8MP2ouyRSpSHmAsLutg03aOTetH8hAGZc0TNGqOJS9m5P
	8MEciBBO9ItGR7dKyq8GTPClvsa0SQIAdGsklSJDpAEX3XoCnhWZJFXG6Pfbh/abXBwMwIdRmxdVO
	2c2ZzyBD7EXEL91xlDSya6bRi84o8QH+enP0OEGvECGtYSef0uGbxUfiyt3mI0SNBWM4IKeibejnY
	2F8h0Vzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVh3o-00000009i9y-3q1o;
	Fri, 02 Feb 2024 00:05:36 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVh3l-00000009i9N-0sZx;
	Fri, 02 Feb 2024 00:05:34 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a370315191dso11824266b.2;
        Thu, 01 Feb 2024 16:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706832331; x=1707437131; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kw5yCa7B5h6E5tqNELeCv4fqCVbEaQWT1fjUMOqoUrY=;
        b=B6EAblUNIg2/uHpHs/rOzExP2n3c2RBOGZlUKiiM427jnefFbhaZiPCAC3ei94Bad0
         NZ0NvfTR5ZCWGHzUO9MvkZoWbF6EYL5+7EJIdi34rxjo5lTFW7jps7IFAEhUavgFf+Mv
         JStVAQF/eS9XDZrPPutVaGkyOB2rd1Di9FoFkmxBfhN4h3tNth58B4HVsiMRcmaX8hkZ
         zKFeICA4YhN0k+JWJO8+NB9Lnkdvnwl44Ky0T3YUwG3WCbpJ3FN4oKZqItxBafhXsXXt
         VkyC3aZl+hI5dXLmHGllJaOSqdiwtTh8rnnGObIeuLyZneJi7C/Uqdnejs3LUo/yY50Q
         vWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706832331; x=1707437131;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kw5yCa7B5h6E5tqNELeCv4fqCVbEaQWT1fjUMOqoUrY=;
        b=XF+0zu5ksxb8N6/MFPsELP9dw+ZOsRuzysGik6m5rZSFpBUzRbegE+ntMU5ZGf1Id8
         ik3lUodY0YrWuTW52Lu/EndNpcspGX1u0TlRhM8ZRgl48Pq2KMd1Iw9fXr6PLQS8bmp4
         yJDX/Puf6rg17MVUBnd4d111mxDE2ABN++Eghs0dz3holJcbIQBRNEQuv6SWeDE53IJ/
         /9aU1cB/EcUMGon16f1d4jIxUdiCUUTjD3S5f+xTcm0xqLu9aN3lefZmbifZhJ3HADYq
         k9wuF2D60h043aspEJ6YQqUvp5wKfZBteJN0DWfjBk80SESq+v17a2WMtZpueDdEtK7R
         2r7Q==
X-Gm-Message-State: AOJu0YyXg1A4+RAMFqCyGrvDcfsIUh0McZ4BTnSW1gyxViz0SUDSq4RQ
	kbkDFJjrxVnE2ckvP8jn08JsPfGHxOEzvChno4XKaFQIvq5YOwDR
X-Google-Smtp-Source: AGHT+IG3Oc+QVcDW1imSv28f6Wfd18UPkfs0THsoQFFMSm7GDFwNpyXEsoyc6JUAhBc82NDm4akIqQ==
X-Received: by 2002:a17:906:6c8b:b0:a31:7aca:a429 with SMTP id s11-20020a1709066c8b00b00a317acaa429mr2525716ejr.4.1706832331143;
        Thu, 01 Feb 2024 16:05:31 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVqP+Ej+Py+JOKNXrBkFKszG2TQ5BitJp54lFM/ULnJrFAc1ThEwV37zImCs1V0f0eDefU0plz4nmA8YW3GvEpfgesqzJ8LlKKoG/cQTSLKgFdp4GlDVA7fbbENVVpIiX5Rglz9ADw69SHHTh8o8pghR4qkBmabwOP09SIfqUNUa8ziP3ewAGr/dVYf+2fuGLm0L3c0CWqnc4aV1+buL5BfYCzCDgyjKrqV783V7L21RduwjXpzinMDUJ+LzzD6P91YNrz88t0BrW2Homhh7ViZCsm+/NMsiFKs02EaAmqcDK99b02kw/c706SVeTz7P5E4LkNfp6eH0jUnieHOs9pHpLY8Mz3X3chY/UdnntiLMpAf/YRQMyMh1827YqyvR8fnU4n91AaOyZbXbV9QJWn02buVYKPHSno5klsYAemlYzsY8T87xFkGhfpNWQqgORiRY2+nBDIGQsGMzWqg7Rq1/X2g4A8WVFsaMmxp6mIE7O0z7+jKh3aSBpAjiYR3vbRqNBRr8Nta93M/1hAB9bog5PYudd/t6ezBNGXqJT3sCH12ovbVkKaAxftXTgekJMH97R6TbP+NFraj7y/peJ1wuakTP3fOXpvCtb4+ohGLj3+K38Jw/JNL7D0ns6yNLuV+l3K5DvAV3Wqho8pA7oSJ47CuZzI2
Received: from skbuf ([188.25.173.195])
        by smtp.gmail.com with ESMTPSA id cx7-20020a170907168700b00a3161adb239sm279824ejd.158.2024.02.01.16.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 16:05:30 -0800 (PST)
Date: Fri, 2 Feb 2024 02:05:28 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc.unal@arinc9.com
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 6/7] net: dsa: mt7530: correct port
 capabilities of MT7988
Message-ID: <20240202000528.efgly2bpfhqxu332@skbuf>
References: <20240130-for-netnext-mt7530-improvements-2-v2-0-ba06f5dd9eb0@arinc9.com>
 <20240130-for-netnext-mt7530-improvements-2-v2-0-ba06f5dd9eb0@arinc9.com>
 <20240130-for-netnext-mt7530-improvements-2-v2-6-ba06f5dd9eb0@arinc9.com>
 <20240130-for-netnext-mt7530-improvements-2-v2-6-ba06f5dd9eb0@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240130-for-netnext-mt7530-improvements-2-v2-6-ba06f5dd9eb0@arinc9.com>
 <20240130-for-netnext-mt7530-improvements-2-v2-6-ba06f5dd9eb0@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_160533_269975_E081CF8E 
X-CRM114-Status: GOOD (  13.90  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 30, 2024 at 06:20:52PM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> On the switch on the MT7988 SoC, as shown in Block Diagram 8.1.1.3 on page
> 125 of "MT7988A Wi-Fi 7 Generation Router Platform: Datasheet (Open
> Version) v0.1", there are only 4 PHYs. That's port 0 to 3. Set the case for
> ports which connect to switch PHYs to '0 ... 3'.
> 
> Port 4 and 5 are not used at all in this design.
> 
> Link: https://wiki.banana-pi.org/Banana_Pi_BPI-R4#Documents [1]
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

