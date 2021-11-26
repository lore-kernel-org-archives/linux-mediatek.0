Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42715C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZT6OyoDGk6X+9EC5SH3XAVExUn0vHFnzlZWbLhn6wU=; b=neiREiUyzwLoTr
	HLGhQ++DQ826E8TaO387m6aXDs88RgZIwEJay8qh6iRHqQQWefM3OhZlqFv2fzPeN1AHQBOad1WI1
	L5dApBUnosoXCfBJYDf8MA7+Focm0fsn3pRFQRrbY7nm7xuQ+WgtFtKRwy+/YId6sdE8SkTISYdSr
	sPv+qaOcacMZb2gfs2Gq+SUZdB57LfKrrag8JNDqqLOdC4ug1YIWC0zUCY2aJ30oBByzEUuVhOfyi
	xJNXDcDU6x4xAx6kl7XJia4jFIl4LuZgzdVmFmFeyXumDxcEcD9fPDkZFKrJwugAbIT9Kjcuu926+
	M5S4cJys8k9HeFKKV5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqYAX-009tG0-Hl; Fri, 26 Nov 2021 10:09:25 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqYAE-009t6L-Mw
 for linux-mediatek@lists.infradead.org; Fri, 26 Nov 2021 10:09:08 +0000
Received: by mail-pg1-x529.google.com with SMTP id p17so7750455pgj.2
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Nov 2021 02:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4W2I5kuwpM2lqQ0SftJKxJYAD53bRmdrJ6iZIfgDzkg=;
 b=IPkErYmmP/MP79xguXU0HZSMDDIrG2wd7US1TxW/lxQfYNasxnfDdJc1Fqr8E9aXxS
 vszY6dfUJQzI0hMkvNQpjC4t/XTiL7rEQ1JWt8ontYmbu+VFFU0dqE2uCBFL0zRXjsU2
 rG5AsTcwffVpz2uKA55Ef79HwxOOeQnMuQC0jyaY2tbHSZ2w9NN0133sDpmaDdv2+kXC
 OGjnyPpGKdF6gl6JZVoaijU5R6+Dt+laQixKm9HgeAwTd6mQ2XXp2GpTSGXaC9CI9dtE
 9GEFFGI9Y6P498ovhEiNrHBGxLZ8P+pXgGG9wWOsDtlPdUBnTQovSuLGpW1SUzq3KHDj
 lV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4W2I5kuwpM2lqQ0SftJKxJYAD53bRmdrJ6iZIfgDzkg=;
 b=gw0iNS9VFX8FkxnFTptHi+Lzv55F6aXS9xZmcpjwyZ5118nCUxE7Ua2vx31eW2S46y
 jL2WPbZ+z6T1qvg3sOGHF3KM9okVYHgHXjkiL9LExfmwBAlwM7lb5oUrABnmnL1yEpWs
 5tn1TwbIkLhcvex9stnFS/h3bU5kDjpTaTCZQGrxCnMgDkj7Io2WUusB7AMjuF122q2W
 CGg0Aku+YslG+4wt+8NEg9YanPGMvmig1qeWs3A96CQkaKKUkH/IFzM8xLJpUloU+25B
 X6Y4V6fhRetew1MRQWxrEP9SUdqRtIpFGP+UzJ9cSlz7rDmCfoRVc/R/AU7FD3dgMacX
 nNGw==
X-Gm-Message-State: AOAM533ei8Jg2hLL4qgI9P4ezdUUutqJL9J1BHieafkn6vd+QYq7UK3J
 b+O+O8GOXDde/MPIIDI3+X+Fbw==
X-Google-Smtp-Source: ABdhPJxVejTdV/NyrWHwGiaTysIUv3zOhCVavwvpUaitec33azBmmuhOyA8uIgkTF6FDl0OeFLILPw==
X-Received: by 2002:a05:6a00:2349:b0:49f:db1d:c378 with SMTP id
 j9-20020a056a00234900b0049fdb1dc378mr19747281pfj.53.1637921344428; 
 Fri, 26 Nov 2021 02:09:04 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:5eda:d984:1426:91ca])
 by smtp.gmail.com with ESMTPSA id lj15sm5238017pjb.12.2021.11.26.02.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 02:09:04 -0800 (PST)
Date: Fri, 26 Nov 2021 18:08:59 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v6 2/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <YaCyO9kKWJ8oog/h@google.com>
References: <20211126093021.25462-1-allen-kh.cheng@mediatek.com>
 <20211126093021.25462-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126093021.25462-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_020906_797207_CF7B66C9 
X-CRM114-Status: UNSURE (   8.61  )
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

On Fri, Nov 26, 2021 at 05:30:20PM +0800, allen-kh.cheng wrote:
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

I have provided the tag in v5.  If your have no major updates for the newer patches, you should carry the tags in the commit message.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
