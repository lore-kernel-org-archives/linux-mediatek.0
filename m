Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB83AC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 18:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbGGH2S3w7HcoJCp7d0j90HcXaq6j3Fgosa8UJEEVfY=; b=bZcckrCrOhflBuTuwTxHdbiqe8
	J/AoUDg7MkkvjSjXZXaUONVkCJ6ZelcuWIh9YSan1NFE7LIj+grBdUvv8rjxxZQTpOCD3ia9rpsBO
	7HO6DY94yzIzyoS3o1Qz79VdDBALPXknYwzY9MdGBwWAOuO0E5UlLBgpoeH8NBJBSQReHoSq2px4Q
	esHGNYVw5BcHlnoWt0KTxZcwNRMJ8u3P7zWFdVg14mgKBMUnhFeMSVuet1SlibRl9/uz+fhX8GKLJ
	IUiyVE2OrCGqznKN3wCwLM3jTYJI7zak1kJkXh8fNGJdxBXeIvPICCkPGGXOFG+wPMll+fCleF7nB
	QBIAicoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sqj-00EJg5-1d;
	Wed, 24 May 2023 18:04:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sqg-00EJea-0U;
	Wed, 24 May 2023 18:04:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f60410106cso10123605e9.1;
        Wed, 24 May 2023 11:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684951471; x=1687543471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PbGGH2S3w7HcoJCp7d0j90HcXaq6j3Fgosa8UJEEVfY=;
        b=UwL5D7dqjeyyVogHuw+vr4kTyy8m3QwcpUwkIf50pcw11+nKU8hibHk9iQG3PduHz3
         l+MnVdjeb1HWtGpz5cosOld1neklNsNQJqIIzjtCrey1rQHzTYfc/RHtoVpOg73HgXlL
         0qNFcHTgyNGa8ajdOaCjick2Bo5LalpYUy2I2XDcwGWCVJxmq2uTVBSXjUagVxZ5Z7px
         cokK63ETdLfT4Wozb+QLhD7APgo3Yt+BA4FSCQCSqQHM0ogLU5qEEWksemPSQ6hKc/jx
         2wVsyrvkc7afl5km4Rtigfr1zTvWO2za8QiPtjCiMTeITDmmle6UJVNFIA08ku3696kr
         OjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684951471; x=1687543471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PbGGH2S3w7HcoJCp7d0j90HcXaq6j3Fgosa8UJEEVfY=;
        b=CqqcX7bLnWQ6oTQQEvJt0/n9/0h8Vtec1B/mMZkV+yyTTX85qeZ7+rHlaAjNV2qIO+
         ZrwPKckLVfLhmlFRWe55dc1mISJtx+5WdqHjbGJqaGBY+8DP9P+kTzqWa/cdK2vVF9lo
         UNmJ3yScdKh8hYNgyH7eaykhUjgQb9esVkecWNmdtEhQhg9gscKkrB/Ioat2uHSGlFRY
         Pd+kLGpf3t577MTmQ2AL5H0h6voPB9MwBvJ17LcSWgpkTRkWcpg7bItcW0nHxwmwTypg
         QRXTWVsLMc03cNCPRcC66ozp2QE0CqAbEH9lzKdr+FIZDQnZLYah6/WCWGmReDl5cmX2
         bF7A==
X-Gm-Message-State: AC+VfDzDlXYgxjEjrh5OeXOnOBJYhxvuUE47C1u2wPccRbh71pbIONLd
	AS8uAldb9WaBEN9GtZOrFiU=
X-Google-Smtp-Source: ACHHUZ4TjJmVnHvv5pYI09ns9MQOl/UVt7YfJISuZVNO22gwZiqXDmnrVLOyMThPojnNCNy/e53ukQ==
X-Received: by 2002:a05:600c:ac5:b0:3f6:536:a4b2 with SMTP id c5-20020a05600c0ac500b003f60536a4b2mr461872wmr.27.1684951470896;
        Wed, 24 May 2023 11:04:30 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id o9-20020adfeac9000000b0030647d1f34bsm15367534wrn.1.2023.05.24.11.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 11:04:30 -0700 (PDT)
Date: Wed, 24 May 2023 21:04:27 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 09/30] net: dsa: mt7530: empty default case on
 mt7530_setup_port5()
Message-ID: <20230524180427.t77iohojxelpa4yk@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-10-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-10-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_110434_188246_639AF324 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:11PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There're two code paths for setting up port 5:
> 
> mt7530_setup()
> -> mt7530_setup_port5()
> 
> mt753x_phylink_mac_config()
> -> mt753x_mac_config()
>    -> mt7530_mac_config()
>       -> mt7530_setup_port5()
> 
> On the first code path, priv->p5_intf_sel is either set to
> P5_INTF_SEL_PHY_P0 or P5_INTF_SEL_PHY_P4 when mt7530_setup_port5() is run.
> 
> On the second code path, priv->p5_intf_sel is set to P5_INTF_SEL_GMAC5 when
> mt7530_setup_port5() is run.
> 
> Empty the default case which will never run but is needed nonetheless to
> handle all the remaining enumeration values.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

