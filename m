Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7DBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mi5JE/FgDea3FL2s0fMkS7ID7d7RibrjrsUiLVkbKN4=; b=NNbTSSJPuKSgD7
	kibzwMWchmBDh1BElrSFG8wNS5KCbxH1+QDjZfTst/OfXujyvFkZsAfKAYZxJt33et09nNoEFuJim
	EoVwvgdN28cXHMdnklAbWwir4Dd63b0L5ccrjudvA4KMpNe72hE9uvVN8gi3YrMaK/X0JcaFij4/k
	gmezxJ9rVU5QZbn6Twgjhy12FeRihXohJ05RQI2OZR6/1B1P5vWhjseVmmG2GCvHD6v0dRq/RYr2m
	OTpoCqPBmcYJpmFCwUjOvw5d1AcoybYCO9jDjLDzHZAsW7i8aGDKhjU8nr4ZHTWkfvUK2xxOtQnmI
	OJT5U90re0HA1zwy6oew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqVib-009RZm-Hg; Fri, 26 Nov 2021 07:32:25 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqViN-009RX1-TA
 for linux-mediatek@lists.infradead.org; Fri, 26 Nov 2021 07:32:13 +0000
Received: by mail-pf1-x42b.google.com with SMTP id o4so8045680pfp.13
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Nov 2021 23:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H8GxqclEr9GMquFQtjl1gpKJQNY7uiPr2ofl1kPxFr8=;
 b=QtX6ktAUTquUbbu/XOyp6jWTVUuSqaNmzTULmqMDfikHAyzqP43gXs0Qiz1+xV1n5X
 ATR9ww7pCysgtrScPJ5/Radq/UKWOxeSOCqA5xNWv/pfGK0sWy0240aVhQUz+upUtD6h
 TATUZrwUNl5/CT3FynWVOWc4prfhgF/8h7WYLdSF6JXRC278QmPNvQrCaJCt4YaQ36JP
 oxjoieXS4Q2tmI3P0nscYNJmSnbKa42ojl9Maut8hucqEZ48Mag6E/RfYcNR3BvnxCtY
 S2eIDcm+I0gHyZoewwhRyDJ89GH+wM69nzAZfg3BoZOxY7Efle4lLQW+aCpm0tqcwCJZ
 ITYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H8GxqclEr9GMquFQtjl1gpKJQNY7uiPr2ofl1kPxFr8=;
 b=Fp289irI36eSdIHNSbIpxBmnLdiLwp+tlrtkNNiZw/CbbTQb34Jo8WfgDlIAh+nmEK
 aAGvgAFfBQw+O5kDmaVzjzcaajqsxHTEnhWnE9NYZTYU7h7JZqJvZfeoNkXMgTKwktSP
 mPTUEhSojNvzPdnYouTqmxXJSx8wO35yDCNoxD2wCR5t7JTirt6cOy71776UuR9SCvzo
 PT95PpGWO1GVfqlY7itQP79HVem6FG8e3YV9oUn7LhsXItioIE42TGoDKtfKsWBYSoZq
 IyTNeCx5j5+IPkAQq+K7dkBEUd5tlxIvTT9pHfhV2x1U1S0zmA3F5iP6DCNMxFnUpxoI
 nS8g==
X-Gm-Message-State: AOAM531A2NoU1zEC2g58pjDvx4/Ai7/SZ6zEhqgNNLH+2boGYS7sGJd3
 2CV6/dqBEehGfBohOKQQyrjU8A==
X-Google-Smtp-Source: ABdhPJxcei67hA/Fni82mRFZEub3sKfv3jtMYS4/HzkNPETjajfDoqXCgeZufPfpR7ZM3kGXnFC6sw==
X-Received: by 2002:a63:5526:: with SMTP id j38mr8662880pgb.86.1637911925535; 
 Thu, 25 Nov 2021 23:32:05 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:5eda:d984:1426:91ca])
 by smtp.gmail.com with ESMTPSA id mv22sm4638283pjb.36.2021.11.25.23.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 23:32:05 -0800 (PST)
Date: Fri, 26 Nov 2021 15:32:01 +0800
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
Subject: Re: [PATCH v5 2/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <YaCNcVjyems1lCX8@google.com>
References: <20211126071432.21990-1-allen-kh.cheng@mediatek.com>
 <20211126071432.21990-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126071432.21990-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_233211_970295_80279F27 
X-CRM114-Status: UNSURE (   7.21  )
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

On Fri, Nov 26, 2021 at 03:14:31PM +0800, allen-kh.cheng wrote:
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
