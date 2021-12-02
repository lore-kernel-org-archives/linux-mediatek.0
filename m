Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9C0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 04:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05NnDA/R0nwO7iY+9sWnF86Cdx0Ps6SQEstaafhBRo4=; b=3zyQ2wZ27WiJAy
	H1Wj6gu6GOIUFFNtXCdDMB+k4sSjbYWLM0DCsCGrRBPdnIKFfdjFBdnY5ZyCi2LBKIpPpYhXl06Ze
	a5iesw/URdWj9Nl8gSEnULdKKpSX1GzyAKenLo4bZg3j8e8L9TTsY+1xLTQ8VF09Up/TEgqNKhbzo
	QcTWhjBHhQmW72OEEwrULEUOUfy5w81BuedHCScDVhLi+oL1fLo+5PBb+MiihnCfm53l80IQAmA+F
	7u3pdP2J1BlMAJwU3aEvKzfSm0QrqUjon8aceRCXishctvLZlrf5s+jKWflRv+HSAnTofLfiwfAQ9
	g9S6Ia4AR0XwApx6KF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msdvd-00Av8h-8u; Thu, 02 Dec 2021 04:42:41 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msdvQ-00Av6j-BT
 for linux-mediatek@lists.infradead.org; Thu, 02 Dec 2021 04:42:29 +0000
Received: by mail-pg1-x52a.google.com with SMTP id k4so15690405pgb.8
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Dec 2021 20:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QPV306Cl1hLkT1aLm/ztTcGSxnCGdiyQM9JvOmh+VBI=;
 b=E13BrctyEiJmk8QUej4+qBU++tdSGEmKsrgPFCfx4zr+AVn8a28NmmgnY75romMi89
 U7ILmdqSDi4IqU1FQskq+DfQT48XCLWbZJLMOpXKWLcwy2RD/8q48vl9tFE+2fXPsZVR
 +ZI+StjehXpNDVvQ5L0pIKJzXtyXOPfQ4mivaLwcwCFo1KCxzlZAizfhCRjTso+t4G+L
 wJgw60wiDhYBTdWf9RshLHW31L2CmL6O4QuDIZMQeurga3UCgV1R1Yyffw6RafTgFsrC
 Vo2cHqAgDqh1KK0SqqfwDrOZ9Uix5RsQYB+cLuVHGj1NDgJE3P7oVXFxcHf73VIjQ65p
 T/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QPV306Cl1hLkT1aLm/ztTcGSxnCGdiyQM9JvOmh+VBI=;
 b=zg990pokMkpDb8RVdg3jtr2wQSG5BT2b2Du77wGaYquYa4BfeHcWk75Zzlw1bXtWHT
 eiVuyC/oKxIUqjGYxKFHEnMP7WTIM2DYv0IY2MCLP1/QOPKlGlwjaKDN7p4i76EnerRU
 k+Ne7idBIBmLJbXiFTDgDhz8jbJZO1kMM2L9g+JSUul/Ufqkehxfv2IyN6a5yvb0PlL9
 qvdK6X/vLq/5LRHzGIOSqHhD4ShYprdImmGkbq7jR+s0k2YQ4Qo0zOGtiVmcdNDrdF8R
 uWP7nyrWPZufpqwOem22T5sWUMt9/pBnVhGCZl1p9U8v0qKIdDDvWGHwNrSBTbkw9iZx
 RHkQ==
X-Gm-Message-State: AOAM5307xncO6GMMh3JlKlOLjdxYXhqXvsb9F+BGFEkiP4nJjLUq/sj6
 Ax7zoBf3mEfU3+/DZnlcMCHJdg==
X-Google-Smtp-Source: ABdhPJyChYJegnkY59sNvTlcAnuBxHuEZK8rD2ydV4fBqk/D+T3tW0FLAm3x803r/bwHx62jIBYF4g==
X-Received: by 2002:a63:d17:: with SMTP id c23mr7912840pgl.207.1638420143063; 
 Wed, 01 Dec 2021 20:42:23 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:ce4d:ddd8:41f4:d987])
 by smtp.gmail.com with ESMTPSA id p43sm1426664pfw.4.2021.12.01.20.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 20:42:22 -0800 (PST)
Date: Thu, 2 Dec 2021 12:42:18 +0800
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
Subject: Re: [PATCH v9 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YahOqtgkkj+HmlJ3@google.com>
References: <20211201075604.27864-1-allen-kh.cheng@mediatek.com>
 <20211201075604.27864-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211201075604.27864-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_204228_404011_6315C0A6 
X-CRM114-Status: UNSURE (   9.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 01, 2021 at 03:56:04PM +0800, allen-kh.cheng wrote:
> diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
[...]
> +static const struct mbox_chan_ops adsp_mbox_chan_ops = {
> +	.send_data	= mtk_adsp_mbox_send_data,
> +	.startup	= mtk_adsp_mbox_startup,
> +	.shutdown	= mtk_adsp_mbox_shutdown,
> +	.last_tx_done	= mtk_adsp_mbox_last_tx_done,
> +};

To be consistent, s/adsp_mbox_chan_ops/mtk_adsp_mbox_chan_ops/.

With that,
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
