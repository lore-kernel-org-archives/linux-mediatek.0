Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4AFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 04:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQmjeZtM3iw1U51lJtFoEd0F8FxwbLJuX5i4O4EKV5A=; b=c9O1n7DDtnfIOe
	G8C9NasAgnQrem6roMfFqTkba4P4P1enuxYG226fFKX1RoQz5P5+VxgcnvUT8PDl2njWAAarL1kHj
	689r3yo4PPPenDiIk+6kQ2RjAT/t52aq8JA/AshGvLYPgVUYAEMYoiDyowW1m6bxsQhpVVStopNc6
	nRckJ6m/F66Y09niYkDhJsJ9nmr6C+U7uELNg99lVI+w6NifMgXsLaVNDmglDhONw0pqe8i/iqqfE
	6B1Qd9v87Pifhb+1xZjkYpChjwJ5XrCEn+q39tcplccWcdE5b2uWDSBJtUtEBZzRrsbLjsLt3i9br
	ixV30aVAZhvIgByOYduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msdvp-00AvB9-Gp; Thu, 02 Dec 2021 04:42:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msdvc-00Av8B-7z
 for linux-mediatek@lists.infradead.org; Thu, 02 Dec 2021 04:42:41 +0000
Received: by mail-pl1-x62c.google.com with SMTP id y8so19367021plg.1
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Dec 2021 20:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q/XmdYzmWlBC/voF+84Cd3udQjdonRFCNCIqCUmDhDk=;
 b=NNI4lbBLOzUh6enNA2zXDD6i/1bbGmC+FP6nollo+ZHi511xLiHCuXuklfoEatdbSW
 c/K2UDB3imN6OpU5wZVX9y/cgHytjg748J8xZWdpWc5c2s/mjPDhWwgVMqKKaZGX/KR8
 N5KEWOuSX6ObkcWzGMI0QUSJfrREjzwt0FlH38L7xhCnOUlCDKqwF76FdcUJMuPKFyyf
 NcPOfpJLQ3fdoJX6usozrWel3ddfQu+4oIgNFru6sBQG3JAIVq+ToAIk0jcJUNombClm
 98B1D6VwKpA9QpeCwgFuO6oyX8A9MSk+vYb9i38GLAnPQQTpxaDTVACDW5OSlJ7IfZLR
 NVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q/XmdYzmWlBC/voF+84Cd3udQjdonRFCNCIqCUmDhDk=;
 b=u2gYlNNgA5Oivo2+iRl3TAJvCt+1ces1fiwhzm7sLjmNemqhNSLvgtUNI2AAdGIYwd
 PXWkBC4JcLylJujuDzw/oYl5+nCW9NRIPWOtHlpu86Q14Egl46dv3Ca0X9FMB/RU76lF
 fNNfwUDK2xqrU5m5iwUFEySr5nDeiZhl9RbBfTfWM64sr0t4NczV1ZYdN6TMNcb5WmMf
 YDtcASsxB4dhZp1wTHtUZlOmrxBg2XTG4Zc50QhR2TohG3p8Mo+r7E39U3bT3z1E6Few
 UJAnIFR9+DnmSaEunDfEyfBSDSX9+Mg47WLiI3wNES1nmqoiENsHXseOd5w5wldiK+aN
 /W4Q==
X-Gm-Message-State: AOAM533/ijEnq7SVdwcGq+ArcDxFXqpUlCPwXGkd7svtCVeKdERM2JWQ
 4BEhkPGpqe1pZHQmgdPhJXlVPA==
X-Google-Smtp-Source: ABdhPJwd7LFTasLsCKCBBJSOBzXW1hcUhBvCVvh8QO8kQ/q9LWJdPJFWFfi3xByxw9fLIekXcskJdw==
X-Received: by 2002:a17:903:1208:b0:143:e4e9:4ce3 with SMTP id
 l8-20020a170903120800b00143e4e94ce3mr12739440plh.21.1638420159291; 
 Wed, 01 Dec 2021 20:42:39 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:ce4d:ddd8:41f4:d987])
 by smtp.gmail.com with ESMTPSA id p19sm1545646pfo.92.2021.12.01.20.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 20:42:39 -0800 (PST)
Date: Thu, 2 Dec 2021 12:42:34 +0800
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
Subject: Re: [PATCH v9 2/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <YahOuiIZ/wGR/TpD@google.com>
References: <20211201075604.27864-1-allen-kh.cheng@mediatek.com>
 <20211201075604.27864-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211201075604.27864-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_204240_319621_527DD4B5 
X-CRM114-Status: UNSURE (   7.51  )
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

On Wed, Dec 01, 2021 at 03:56:03PM +0800, allen-kh.cheng wrote:
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
