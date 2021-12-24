Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B731BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 06:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JaCWdrimXWjtdxowAfZxMmiWOCsn8t4+8gfDeiYCTg=; b=cpe3dzUH9Wbq4j
	69l60X4Wc9ijwT8z62ZKYL2IAeUiI0AVOwNcqPaH3Nk6+06XzvcfUN2IICeeY/65v3qvumLKtmg6N
	bGIT0E5ThWvrPcyMUcWy09UOELDm5aCWBphfx0BMw8AO3FI2/x3r0blIH9UwT/5Pe+jLMbQdC2kwm
	h7EDgwGVKoAjhDk+Mg2lHWbBfxkXGMJkW7MMTqw0ht9FME3gA9FVNk1twgIxdUddm5WWHVoVG0nFX
	pUMP0X1P99aI9GT0r6IqVK4L5UsTzUJ170Cev+RFYxczRc2mW1KkxXe+hz2ciZ91W9kf8SPLvOCEG
	dLCTRSl0EtsmbIhkzN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0dxp-00DmuB-U2; Fri, 24 Dec 2021 06:22:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0dxd-00DmtP-Bt
 for linux-mediatek@lists.infradead.org; Fri, 24 Dec 2021 06:21:51 +0000
Received: by mail-pj1-x1030.google.com with SMTP id iy13so6873307pjb.5
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Dec 2021 22:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sNpxwzLQQ6ADONuABqcXLxGvwIlj1QGrF7+dtH+1LOU=;
 b=GmUZAkmIZOcRLa10vWcuvWP4LRA1og/BAQ++pEm399YMHDpglcUCZu7u7yvDKKtHSb
 3PnYSflcfw/+sKzQnWkRpmn3m4BnSO6E+ve2TMqquar18IvYQtVQQBgMUEeB7yqkf0QO
 BHllzHB8rFICQTTkZmnnwTqVcr4L176uKW2xkT0o+w+kD1KkzRlWgffPFtgsFEf0ep1A
 2PqQZuaSzUnrasEGhUcCZ0/dC+M2aytflXq7CaMWWIHvioJAunPvqf8RRUFsZwK03b9U
 z+yf8IspNjlUljuHVX5FspZ8e5eJYTjbM6y6E9HsAsr/QBbn9B4CJyL+3V3aA3aGVBXh
 FSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sNpxwzLQQ6ADONuABqcXLxGvwIlj1QGrF7+dtH+1LOU=;
 b=Jp2u1Vqkf8DEwVMbk8nCB+kcloDAjLwCPwDXntttQQDn4cuVKaHDx3H0KFeuevl7N+
 LW9nxS/C0E8UcZ04NCT4V+s8ybdG/k95InGziEr35peiZhcEp9YAbUaueX2eZa4dj81q
 duRv8IuI/ak8hAqfAOJUOucIbVn9s/IXEKlKN4dl9CIcTcZwqKAsSLW8pSDgPNP4AQNQ
 w1PPV85kChWZ4Znia2szDvU+tElNjfvH1bTh/3C9Y/1zd8H08aNe4RXAHpI7ZQc2OqKe
 0aTD6TAuDduZCPpXCrNCMRjdHqf7vL8Y++VuGvps0zlW60lvPV0mYuQx+fdXzpo+1vTn
 YdCg==
X-Gm-Message-State: AOAM532qbaTyOC/obIL4wsnYOh0dlB75HeExDb0V7Mi6ANegOKb9yWXH
 zsUvT9pgC7V5LoQC0diogXY44SPTCuVfTcI/ppMX9g==
X-Google-Smtp-Source: ABdhPJyhDvNGhoociXAck/G2JM4Se0qdVi2Xqx6nfDisVkKSnKsJu5HmedXIB1DJhmn1AP+qqh+OmfwaiDIXyRdEh+Q=
X-Received: by 2002:a17:90a:fa12:: with SMTP id
 cm18mr6332101pjb.141.1640326904644; 
 Thu, 23 Dec 2021 22:21:44 -0800 (PST)
MIME-Version: 1.0
References: <20211214040028.2992627-1-tzungbi@google.com>
In-Reply-To: <20211214040028.2992627-1-tzungbi@google.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 24 Dec 2021 14:21:33 +0800
Message-ID: <CA+Px+wV5HydJdxmoEF7HkkBcAE_jbmtyBeAE62yuKMUJM=jGLA@mail.gmail.com>
Subject: Re: [RFC PATCH] ASoC: mediatek: mt8192-mt6359: fix device_node leak
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_222149_481363_40F9B53B 
X-CRM114-Status: GOOD (  10.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 14, 2021 at 12:00 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> Option 1. Machine driver makes sure the object is valid until registered
>
> This patch adopts the option.  It needs snd_soc_register_card() to call
> of_node_get() somewhere to hold the reference count of of_node.  However,
> I failed to find similar logic in soc-core.c.
>
> Option 2. Machine driver borrows the reference count
>
> This is what [1] adopts.  Decreasing the reference count in device's
> remove() to make sure the object is valid for whole sound card's lifecycle.
>
> [1]: https://elixir.bootlin.com/linux/v5.16-rc5/source/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c#L1065

I guess I have found the answer to my original questions.  The of_node
in snd_soc_dai_link_component in snd_soc_dai_link is mainly for
matching the component[4].  snd_soc_component itself should hold the
reference count.

[4]: https://elixir.bootlin.com/linux/v5.16-rc6/source/sound/soc/soc-core.c#L749

In summary:
- ASoC doesn't need to hold the device_node reference counts.
- Device nodes can be released after components have bound.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
