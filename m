Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE81FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 07:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McFJFmY2WFxSXRewgPLEhUxBVjxh+b6gVOiwKKlMzzw=; b=wCyfCXhXXKAL//
	WJNkBHjtd0inVygv7DIAAew0UrPXDpjlMYe/r1V4r9E20/qsSfat/D+4RPGPUKh//I9P4y9H8VDEi
	29/IBzlGFmu+9AduPg4U5A5ilDFCS12WyMj3QBLZPQSm27Ua76/nO59MPo+W9DRH/wEJ5cXSJpenE
	J3bwrZ5fh8EBW1zOLAlY5D+Bxl1fN8ZodqgQ3isCxaZHpEgoY0yty9iOnK8rPryxSPw5hVJRshRrv
	TJyvsU1R26AVaZaak/QY4pn0f+m7xyYzSkMC5k00dqvLVY1LfSitrL2rKDPfeOyGC0K8Q/oWMuVkK
	maThESkNfDwqD3l7aDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mraqX-00HaIQ-Eo; Mon, 29 Nov 2021 07:13:05 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrapn-00HZzC-6Q
 for linux-mediatek@lists.infradead.org; Mon, 29 Nov 2021 07:12:21 +0000
Received: by mail-pj1-x1033.google.com with SMTP id h24so12007039pjq.2
 for <linux-mediatek@lists.infradead.org>; Sun, 28 Nov 2021 23:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XOVClEjHy2YCmmxBNWZViUvkZtP1AdWZ7jyiRVXX/3Q=;
 b=Sjv5tuU3YefSTVzJGdWEKxum4VaFMKb5gxi04NlC81VNM6HCAfuQLXGCZMvt83jl0B
 095duvMeJkcxy6vpoByoMGLUVgoALS4C9E4mvfyeJgpTr3CfyPC4V7mK292GP9L41NYJ
 J1CNIFmMyGbSsvEgUUarFrLyxv/z3D2jvMJymtJP4B69F5Wk8evpoEVg26aowPzBqPlx
 a0DrZ20URASj+2Zc/cFzyir3b2v8oA8iqJawkdIqTcKILSNUyaRrejfS+HJdInNrbrdC
 bxhXHDSafZMIAajFSMvxtE6S/cK9ykm51ZAsZ7ufCBS7XPoE+jfqT7dr2UCXUTuiQ8qv
 7WfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XOVClEjHy2YCmmxBNWZViUvkZtP1AdWZ7jyiRVXX/3Q=;
 b=NxrsGT4LQgddE/iOt7p4+wN4fNLBJ4QreuO0wVczpubFsS8p49HJP2TiCX5fZy0Brz
 bl0Tg3rdqJIuIvDu6hWIeeV1bJk0QDXqyD+AUJOwSwdKhrABGF/cgulsB1+GJ5SZkSkb
 saQPtWXXlyFgDde9Tmd8B0MsvTfcylWq4t7P0smatHXsEv5eruVGBO7XE2rgExA5Tahm
 eRCyR4U6ucCrbhD1xkIWr5KBXLpbDyUBmPPrmBAlG3fm7NClDhxsua49dbT0beQuUPo0
 n3XYq9KaDRKEhOfCwtEhHNt8P4eU5jWWWdmRtcDLLI3bsUGv7vWSE9Wqu7OS4KnA8xiI
 nSLA==
X-Gm-Message-State: AOAM532Tu22drW5AO1A/xBlkGYDQOxWIBmVaes2VFQkolesBCOzSmwEy
 jR0oEeFI+MiNm+IFD00iHskSPA==
X-Google-Smtp-Source: ABdhPJwOh28YXHGKAJUi7kIV5rLOOLWW21lh5L1/C7V9rKaGzWrMqT4TrSV/3iTvTifnRN+wFK+7vg==
X-Received: by 2002:a17:90b:1643:: with SMTP id
 il3mr35457906pjb.182.1638169937067; 
 Sun, 28 Nov 2021 23:12:17 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:3807:fdf3:5573:47d6])
 by smtp.gmail.com with ESMTPSA id nv12sm13818886pjb.49.2021.11.28.23.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 23:12:16 -0800 (PST)
Date: Mon, 29 Nov 2021 15:12:12 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, cujomalainey@google.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v7 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YaR9TN7Aad5DYCg1@google.com>
References: <20211129063954.1616-1-allen-kh.cheng@mediatek.com>
 <20211129063954.1616-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211129063954.1616-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_231219_278567_6B005A66 
X-CRM114-Status: GOOD (  13.41  )
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

On Mon, Nov 29, 2021 at 02:39:54PM +0800, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This patch is to for MediaTek ADSP IPC mailbox controller driver
> It is used to send short messages between processors with adsp
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Please double check again if you use the R-b tags correctly.  I have provided my R-b tag before but have some more minor comments below.

With the minor comments:
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

> diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
[...]
> +static const struct mbox_chan_ops adsp_mbox_chan_ops = {
> +	.send_data	= mtk_adsp_mbox_send_data,
> +	.startup	= mtk_adsp_mbox_startup,
> +	.shutdown	= mtk_adsp_mbox_shutdown,
> +	.last_tx_done	= mtk_adsp_mbox_last_tx_done,
> +};

Rename adsp_mbox_chan_ops to mtk_adsp_mbox_chan_ops looks better to me.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
