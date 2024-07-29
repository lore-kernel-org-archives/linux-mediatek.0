Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C490FC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 23:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrzHUieE57O8Xm/6GB9EXPFIIeoNMve32gAhMa+3RzM=; b=s4JnLVUR7OjVUtwgvB9W3X1iLU
	33wTVnTx6dgl5rQMBE16vEKfKACDzCjoRlZBTHwgZ/JgrO09MP6MkHZt0QHNeL3TwJG2Pos3PfywT
	CCqFxb110ronZNIGUTNRKJXgGiv7MipzMJerw9+zh3wo8dZFZquZn2Nfrj6W3XvK4eiN98777pDbu
	rkDF/4bP5AWeQpCqdYl0qcEMcPEODYe6KxfD2DyygGI7sLK+JA6VLSeY6zPp70SiXH3q5gbo2aXup
	OgMwAXnfsEZnWAFuGx30KByDVow0HAlUxY5Tgoh8i4Ei4F21d5w2IfzDEhJ3tAPxn5Hj5qzDz0cyI
	JcKQ2Aeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYZiu-0000000D0Rm-11kG;
	Mon, 29 Jul 2024 23:24:12 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYZiq-0000000D0RE-3qDq
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jul 2024 23:24:10 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52f04150796so6686844e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jul 2024 16:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722295447; x=1722900247; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XrzHUieE57O8Xm/6GB9EXPFIIeoNMve32gAhMa+3RzM=;
        b=evcMX5KGcxgLVA1LIPeeReNLfgNlFe+F98icqJIi2HJe4qYl47ZIhonZMLAkWAaSEZ
         guDGH84P+jU+bxVEQLkWzsp/sv5gakeph4B1iW0rUlDoUP/nikyIe43ZU4S889fvE4pe
         T5vr1gxcehXguZxTJDsuURL/M/mO1E+Va523g8DD4GK+eiUcPTELFhY1WWPs0855REDd
         naDaCl7+NJLovkV54UOyy1lInF1OlmNr0RgeL8ou67sSTsMf0WnardZaC9Uc9TfKuyY4
         zXTpqrx1boaeFosAMmdAlqxFTl4wzP3NC2NEQNhDxUJ6Su0oh14L3jPfiQRi1iIPSx15
         AH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722295447; x=1722900247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrzHUieE57O8Xm/6GB9EXPFIIeoNMve32gAhMa+3RzM=;
        b=N8jS1y4hx4vph+Z6GANa2Cu2zRIjAYe7Ys6+lq6M5m3UE7Un8UDK2XcOXSdbPL7W2B
         ziFLpyQrKR4CCFcGceVSwpZpzxHZKDK13aNHt4bPsw4oJWC7iCevwPtpYl0rPjiv9D6L
         B4sjgnOum7sZeesSCwCDmIomSgnU7Nruh5D6nw2VcyNZwdYppYkzeVUnvlXBX5qSJW6q
         lCbolQAmSu0qQRAC96PjpJqoZiX292gZFwNDzUhJMk1RuVythE9sKVPwhoYEcFPjIt9f
         Dd6DAo+NuzS0aj56OSmQYdH28ysdjPnUQ79iYO8EJQHUi2qvgbWJUBO5Legf+qlnMiQx
         Q0sg==
X-Gm-Message-State: AOJu0YxyZ706A3BXgYEsIbtzPNfnrakCK2q2vgJkM8RR4/+QyrevbJvs
	sEnf1uGszEgpBjS1NWAluYDAgjcD9/R6EiG7d9kqQlBqL7PWlYwXQmom3yf6xFY=
X-Google-Smtp-Source: AGHT+IErWyDhMP9jROtqhZFDJFA2vlY/gpijXBfEM3ZnLqW7745VpivuWk0nzblQmCBzAIE9vgZE8A==
X-Received: by 2002:a19:2d5b:0:b0:52e:f367:709b with SMTP id 2adb3069b0e04-5309b2c3056mr5120927e87.42.1722295446834;
        Mon, 29 Jul 2024 16:24:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc3f1bsm1648737e87.1.2024.07.29.16.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 16:24:06 -0700 (PDT)
Date: Tue, 30 Jul 2024 02:24:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Chen-Yu Tsai <wenst@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: panel-simple-dp-aux: "DP AUX done_probing() can't defer" on
 MT8186 w/ Collabora kernel
Message-ID: <y45w6ytynovupuiwky6atwonho7r3r2hx5mnwxdifh7xvh4nr5@jxssn6blkm5e>
References: <38a703a9-6efb-456a-a248-1dd3687e526d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38a703a9-6efb-456a-a248-1dd3687e526d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_162409_158213_441EB379 
X-CRM114-Status: GOOD (  16.29  )
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

On Sat, Jul 27, 2024 at 08:33:10PM GMT, Alper Nebi Yasak wrote:
> Hi,
> 
> I have a MT8186 "Magneton" Chromebook that I'm trying to boot a kernel
> based on Collabora's for-kernelci branch [1], using a config from
> postmarketOS [2] (intended for that), on a Debian sid installation.
> This sometimes fails to enable the display with:
> 
> > panel-simple-dp-aux aux-0-0058: DP AUX done_probing() can't defer

The error is caused by mtk_dp_edp_link_panel() returning -EPROBE_DEFER
(most likely because something is missing). However this callback must
not defer, it's called at at a different point.

The actual issue seems to be in these lines. The callback tries to bind
all components, however it should not as the DPI isn't available yet.

[drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc/dpi@1400a000 to encoder TMDS-32: -517
[drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -517
anx7625 0-0058: [drm:anx7625_link_bridge] *ERROR* fail to attach dsi to host.

> 
> I know this is a weird out-of-tree combination of things but I've been
> asked to report this on the mailing list by wens on the #linux-mediatek
> IRC channel.
> 
> [1] https://gitlab.collabora.com/google/chromeos-kernel/-/commits/for-kernelci/
> 
> [2] https://gitlab.com/postmarketOS/pmaports/-/blob/master/device/testing/linux-postmarketos-mediatek-mt81xx/config-postmarketos-mediatek-mt81xx.aarch64
> 
> Serial output from the system starting with dmesg and some more info copied below.


[trimmed the log]

-- 
With best wishes
Dmitry

