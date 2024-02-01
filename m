Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2366C48286
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 22:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGL0/mr4ym7CKovzWGoI3YHsQx9lgpuDYhvCcxZjNiQ=; b=VNRuIuZlWHDYOeGJtyFVzB0aPW
	mcFD/vdsFu9WGL+BLCbYcxChZK5N3UKtEGf+XaxCX6ymkLl9DZGZdgoCFy4lnYGn/lZ+SIbZ/qxOU
	npXYutW+wN+8N+xPyp8rw901wWBJFrYVPfnXo9gf9rc5xesg7C6XmDGG8oOOjp9pQU195JW95P5h6
	yw9BgzlYl9DXYqfIP8xCEDRyDVaAfLWVBoHn48gQu6Dl30ydw0DqfCdUSNCLF3Pq0xwCBAlvgJsYp
	Tkjl5ZKldVYFKYKOhpp+4j+/OZZAMkx4kqM+og4cByF+7GE1jXah7V6WOmV1Ze4mcIM+G16brj3Kt
	6PU79Q6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVg2C-00000009bj2-3Owb;
	Thu, 01 Feb 2024 22:59:52 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVg29-00000009biG-2WJd;
	Thu, 01 Feb 2024 22:59:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a3122b70439so211040266b.3;
        Thu, 01 Feb 2024 14:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706828386; x=1707433186; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nGL0/mr4ym7CKovzWGoI3YHsQx9lgpuDYhvCcxZjNiQ=;
        b=iX1uELOXd/JcKLPWKgiRtwEVD82bsekQ5Nf80gKIqOxEQqqLKsqqvANJRb7RgtHytd
         dyM5ZnEFkkseWKNF5BWdZMT+SdBHzzh38mHrag5kf4J02db1tPEgi8OjUM85/xkQQQlL
         Gn+leOZwtjlwFbKK8dP4i94wdViGmpwMy6pVMRetlaq4U6eAXUCKLVjEzzgxEYLrz1Yn
         SRLxs0fDa4dcJ2SGMqQtJHAcJREwToaqb4GCwI5rN6HDTP6DvjmHVirpGa5OjZx86SQT
         zRcO/pkgoqqBuOytj47AML/rmKd/yD/GpMV1+W9R0jF9JvcEm43il3s9iXZrKsRhLExO
         r/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706828386; x=1707433186;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGL0/mr4ym7CKovzWGoI3YHsQx9lgpuDYhvCcxZjNiQ=;
        b=B0Hq/MVNjYsH31mIDKzlnLK+2dXuQUzM0oDoZa93HgzGqs2KpGiBzJAjSuIKMfBmqs
         tQGAhKhg4e2dtk+UR3n3v8X1iKvzA/gZ1prY1lwVjQw5shNc5eSSyWWF012xJc78nNeM
         hCnGsOx+5FtatCydI9I41FMFZEm5pnWnOoMlMlr+JUbhtsQf7Bz+EWlo7TkWoMkB9m9u
         BwZi5lQPHE6oscOV8tUULlKn+UWkrKZDCpeci9P+zfNH+odvzAC5SjxbSLylpv01JXIN
         qpPbhl/E+p48t86n9YH30PXgY21jvO6hL7vHL0MsR13JKygcTfzuL24LHymcYY/pHpRh
         1ssQ==
X-Gm-Message-State: AOJu0YzT31WuKf9LoIpbDy5Ucz+Uhqf+5RZT8J1vfTm21F4Bgx7+1wG6
	+pBTpl69oLp0af+wHhxG956yXOLRfxF+M4YGmoecnxM0o+N12OtiR7PT14eBNkc+uw==
X-Google-Smtp-Source: AGHT+IGIXYoPWjcTqfZvpzrofTMgbbzDgUAvJiP+yvo3hM6OfjXVoirGeEBZC6wyxaP5AOcQDxoM3g==
X-Received: by 2002:a17:906:f146:b0:a36:71d9:7986 with SMTP id gw6-20020a170906f14600b00a3671d97986mr4630299ejb.2.1706828386396;
        Thu, 01 Feb 2024 14:59:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWbexIJZO3KkOMU4Ka1YWj4w3ugV+tA5R1VgJOH4BlUoayo2dLNDWpCRqNZk5r25GjvhpbQAShdTHFhx1gN/d9Hf7JdhhoVJjyJb+HWNTyf54ofjWwnlUimXJ9xakFPLdNebQSSZVSAa/vy6HXZpBMlcZ/ASdR/VhXzHXtkeYNRqTiuE3HGbxE2Al1sF0cyIG0DsUcZX5hsbTNZAD16xHRyJuhofjJJStLnQmhv4Zh5twWmkFDMsWtH751O8G9hkuorvJd7iFysM7M7Ly9/kkpWb1CG8qowAixSPjNE+gUtL0V18XpOxBiTj90e8DPC+sF2q6sBf9D/FQwV/Ft00Y7Hc9w4ty+m+vXSvfedtIF8I1MDV+Ffv8wgnKRVzHzeXbSSVFTCNFjpDbuOGLN4HiayUU3AsbhxRVymlVPeLUxA+dA4FckyKtM6T0oDYQWejANfeAxIf6ZycjoGTqiSXX94B+pyXuAf3AczRTcmwZE80SDbO16U/Gn1p0zJ2haREHd7wTnmaILn31ob9V9MntQ1qXTMI7aXoWkk2WuhEYDpGGlsTg9sWl5HdffSxXxHHmAW1Ljh4apbskNwfV3KWXs7QWZkQHqkStjzSCO+navv2WpVic5BPvpO77iRQptK7uBxAWoHpf5cQ/BSBAaok8UJcrAbQk+vtd7CycRHO3RmCvIvALUX7OnUXDCHyePe
Received: from skbuf ([188.25.173.195])
        by smtp.gmail.com with ESMTPSA id h13-20020a17090634cd00b00a36ed37683fsm229705ejb.215.2024.02.01.14.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 14:59:46 -0800 (PST)
Date: Fri, 2 Feb 2024 00:59:43 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc.unal@arinc9.com
Subject: Re: [PATCH net RFC] net: dsa: mt7530: fix link-local frames that
 ingress vlan filtering ports
Message-ID: <20240201225943.abphuuavp7bkbrt6@skbuf>
References: <65bbf40d.170a0220.a87f4.becdSMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65bbf40d.170a0220.a87f4.becdSMTPIN_ADDED_BROKEN@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_145949_669866_9E00FA3C 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Alvin =?utf-8?Q?=C5=A0ipraga?= <ALSI@bang-olufsen.dk>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 01, 2024 at 10:13:39PM +0300, Arınç ÜNAL via B4 Relay wrote:
> base-commit: 4e192be1a225b7b1c4e315a44754312347628859
> change-id: 20240201-b4-for-net-mt7530-fix-link-local-that-ingress-vlan-filtering-ports-6a2099e7ffb3
> 
> Best regards,
> -- 
> Arınç ÜNAL <arinc.unal@arinc9.com>

You sent this patch 3 times. What happened, b4 didn't work so well?

