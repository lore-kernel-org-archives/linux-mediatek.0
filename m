Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3978606A31A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2026 10:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rQh8a4d0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SAH7LPu7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PqC2VGlCGIsA/VW7WOwQfmzHfoq13g3huhkoZR49dMA=; b=rQh8a4d0wsFtWVOJtWXd0jm9Lh
	jJb4x9H1ZXiEcnw5INo8/fSw0T0sN/Jk9a+ETjW4F/R0ejqpMosa4O5cLagFAKVrHgt6FElLrVdHA
	FMRKdg1mUUIqmUvTOCGWWkySreisO8oU8atgLjEONoc+aUhlLH7GMctibHjQc/TMFHnbE7EVJfZqK
	VKBAa8tLczmrwjwOMbgR95Hjkuz3NDObU4dcDkSeXtMV9hkx0GlOpIwi+S1YTZM7tL2503MLYgDsY
	fzE8UsV6lFpSjHv2ViNmNGA7f1jxvGjVpN8LSNeisM3TPtHXOwGW//uC0fWAP0r0dU1oKfJbTrs64
	PuUF9slw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjhO-0000000BNJU-2Umy;
	Fri, 30 Oct 2026 10:19:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjhL-0000000BNIr-1brK
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Oct 2026 10:19:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so4346475e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2026 03:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793355537; x=1793960337; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PqC2VGlCGIsA/VW7WOwQfmzHfoq13g3huhkoZR49dMA=;
        b=SAH7LPu7aBMi+SF5X+H5eesjcXkq9UjQScWlQmvVzjOz5/7RAxZKfLP0PEbykCRxO1
         HXt8OoIRV74yJB91tKsaErLb4DLvL34di7gJNK6aw3OnuvDcpn4e50pqXSjIgrECLakO
         ERwnPn2t/punw7wejcQ6VubQR6oyCzXYTDwPm+dc+RmH7yqnW0Lw30hjxUy8rI0SHucO
         FOyLcToenw5W5G5KpalFSKGGXFNxSctJMAUWoUJKcrfYweLh6J6ZJIIXbl1aOaGb0OTV
         y/yHrSzYTEISaP2Yxfs0rXQLo1EPYbOOeN0GnOoUPmbsIajDmJfETBbRf7+4lEO/owNV
         4xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355537; x=1793960337;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqC2VGlCGIsA/VW7WOwQfmzHfoq13g3huhkoZR49dMA=;
        b=bvFqU3+1WLo+309IxjVNSa7WK0KYSgvrQyTNSwtMJOrLhXM12ZmG3t66kcRBAmA3Gq
         +mcz5MbmFW8XaCsqBrdJkZMSYhcdbORel4zCrmGMOgxzqr4JzyQbFi4ioQJSBwTZrUte
         hip5ZJVkB7Wfty2ppqIx1oAQ2nn1rNEgo9dRAdKVF8vRx3XshWnnVn1Hg2qTKuXmu2YW
         JTfCiTOT54axZpmJ0S2tOO3z3ZU28lVWUivMr1w0spOEelfPmI5N0cllbeFXV7/U+844
         kTCc8mpmh2bFgVEbOLi73AtiT+MuXCQ9GaYUfU5JGGNgf4DI+wNi+XutMFogPhwl1Awe
         +Vew==
X-Forwarded-Encrypted: i=1; AKwUvBwTvp3MgjDqbP/cE4WV2UVqBblxDjF5Xo0Te/Y/PKUpjo36jv/WXUl1UwB22d/Bap8dA/5KelirG5L1d18wZg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJnaXqdABnXjg4Yck6G0eW4sNVeAYEg97C5YSZLWT85Gp24rkiS
	BLE8Y6yhnnl5Nvv4t0NEylUR56y+Jgso5u3UUy7AyjVqAqOA87Ke1faJ
X-Gm-Gg: AYBFou08s3BKWPFaoJgvsm+6ESdKWjPQiss87Qcxc3BzThukxwBMTwseMUyKPEcVuyR
	i5s7tRYQPfhf9LOw1wq10E1kyVwSeUU+UarMHGPoFJp4ebe6on0EolgwIYdrOOzASJhElMB5jsG
	ynNUAv2nqBvC+n17F08z7EJOz1awa3dvYarhOWn8ar2DdrnbkgN0rnaUzVnnQZB3MyinzX6oGDo
	2ctPnGe0TFZuwt8+h0KgNQaf529AS+cfdHXdvBIjWhq45grRokEuXRfJ8hEeFpuVRIs6Mntbjbn
	CslnELjUIUQRMzQqGQmb7KTezyQ5ua4SLV51Qzkti6H+KgU3SNp8pzQBnSUvXR/XnGNEOGzSpWs
	PqdW1ipprU1z+SPkrKqZ6L0DjIcWuXkkVTrITupdCH5fq+BiDvdRrN9sSTnFZu5X8L1juuRQx4Y
	JpUCrVHbWZXn9Iv0Ovxj0XKmbxhJDVDZ+lF4gIVRybDfVfHDVSSH1TW4YA490SBhLaSrM3Ca/hw
	Kl14AvD6InSMlGPleZ9e7TpTEC1aILl66rqP1feKNJjC1p26C8ayrY2csPQ5vK1FBZgUEyPeE6o
	Nsxcy16ujMvmJ6WT+HJfBpNe4sfkwcEJRmm7WI4p9A+kOxtKHP+aeHSGZusTQf+fdGybPiNfmie
	9fnznHi9qZzgb1t0znUH0f0rt/SRnslsuqgg89Mks17KSQRzzF864i4I/vdcM+WqlBBLwVDXs02
	oOiAOCpBN4KQDu
X-Received: by 2002:a05:600c:4ece:b0:4a2:40:8d2c with SMTP id 5b1f17b1804b1-4ac17b2c396mr36235115e9.26.1793355536801;
        Fri, 30 Oct 2026 03:18:56 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a5a7sm2410452f8f.37.2026.10.30.03.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:18:55 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:18:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Anthony Liu <anthony.liu@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, Sean.Wang@mediatek.com,
	Leon.Yen@mediatek.com, Quan.Zhou@mediatek.com,
	Ryder.lee@mediatek.com, litien.chang@mediatek.com,
	kun.wu@mediatek.com, jb.tsai@mediatek.com, emery.hsin@mediatek.com,
	linux-arm-kernel@lists.infradead.org, ingyujang25@korea.ac.kr,
	shayne.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
	lucid_duck@justthetip.ca, matthias.bgg@gmail.com,
	eason.lai@mediatek.com, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] mt76: fix buffer overrun in pkt buffer
Message-ID: <auRvDN1KPy_qhb_B@stanley.mountain>
References: <auQjsDPP1PeJg5sV@stanley.mountain>
 <bb9c40516e7379bf763b1ba7cec228c354494223.1793351111.git.anthony.liu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb9c40516e7379bf763b1ba7cec228c354494223.1793351111.git.anthony.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_031859_462634_3E59BE19 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 05:05:54PM +0800, Anthony Liu wrote:
> The last patch (d4e5ca3483a0) addresses mt7928 F/W 4 byte-aligment
> requirement by reducing pkt buffer by 2 bytes, causing the chance
> of buffer overrun.
> 
> This patch reduces incoming skb length limit accordingly.
> 
> Fixes: d4e5ca3483a0 ("wifi: mt76: mt7928: makes struct beacon_tlv 4-byte aligned.")
> Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202610172141.mmRmGqow-lkp@intel.com/
> ---

Thanks!

regards,
dan carpenter


