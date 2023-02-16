Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42094C636D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 00:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CE4xiLmA9VQyI91JLYE61lSZLDddIMxME/1xb4rDChM=; b=fK1ltvn6AKSjJWtBKICYj4/Hd5
	ETkkNG8uX0l9/w9jMhKM55UE04F9ldv13PVYHLuZrJG9r52Td/O25cVdY4JIUsKucMr4G5qRT8zXU
	nCMI2Q8ZbG6BydGJsjRouCL1idKHBaLEkItWi0Qx+PIVRsIqVRlIQHG1k7r0w2IDOt7Hvzv6Co2eC
	bwUXq7Lr4eV49KFwAJ1jYRuL8tGrol2cmP+iH+1PQWCM+YYUAMm7dUCuYGukBGwqYDQOOeaOPzkU3
	jXUF6Mwk6Fr/zS6YI1MEe0LNWlchzJQnDfv3HdY2ts3r4YCpzs1ru1/RErgJVorej5m4Pte0q/hWV
	IKxc5/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSSVD-0088mz-83; Thu, 16 Feb 2023 00:51:59 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSSV3-0088lN-9P; Thu, 16 Feb 2023 00:51:50 +0000
Received: by mail-lf1-x132.google.com with SMTP id cf42so872218lfb.1;
        Wed, 15 Feb 2023 16:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CE4xiLmA9VQyI91JLYE61lSZLDddIMxME/1xb4rDChM=;
        b=FFLdjQhRgM6nTbQB//R6Ov520KvRlsMBttV4XYizVX39hkJ17stscJ2kC/2F2SsrCq
         zzq01UwVC+BCJMnRmPiD03D5wBwCb9Bp63al7ELpY7QH9RQGTii1g8BQqZW/Lef5ONzy
         cXb4Q+LhJcxSCgw7uqtQ3qcW9cr0H1CXxR/xnYulcpcdtUi1a0gUYbO5xhkapjocfD3N
         pHMPw6tua4wDOimnbnizgpTuLSb3lU9PMlgjWvPspCi5NcyFw7ilbD8F1apRwhPaeR18
         QsNtyYsZlwFP5S2G8irueAl/C/1zyZlwQmGKbuJ5NoR+7lr64oL36LY8xUStwa6D6a3G
         M97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CE4xiLmA9VQyI91JLYE61lSZLDddIMxME/1xb4rDChM=;
        b=YyS3OIXbCyutHNwj5ylpX7cr+jfhelDsgsJcvfmHrCcyP2N7clr7vmmU4JVks2nvg6
         05x0mvIii6+E+a9TLPYPOoQwBl08vtW0eBGplThB/fh2Ci+ax20Xw10MoZ3DctCJBaOq
         tA5zvmpXzhyQDbtOl6EkGPlVA/zduxi5ARs5skrjqVOJo6JllmPDhREKQ6jGzcI8lER+
         1pv5psWX/6zvRupAnkKIjA4yLri2oVFYw5lSJBbFVkJuSiXxjbDMemCPfr6c4BHUYSv1
         cG2CT5dtAG9djfOc9mUH3x5OxYMNI07ra/1WBIRcAQNoc5c+y6yiZn5Uguz0YRhdUQ6Z
         1tSw==
X-Gm-Message-State: AO0yUKUuKuNiT5EvWrMTq4hnm3vMl/VHHSMs9DcuiORFiA/e9St+szgg
	67bvlXroDo5qjiFmaYSyzD7MPCAWppZ05GQ1kA==
X-Google-Smtp-Source: AK7set8xhRSu9owX2yBWOpqwdcAalnQf6+Nf6OvAqzeeso7SajB/K2u/G+Hz53aTuLqRNuI6D5TYWnUmksvLC5x4tl0=
X-Received: by 2002:a05:6512:4c6:b0:4d5:ca32:6ae0 with SMTP id
 w6-20020a05651204c600b004d5ca326ae0mr1100720lfq.0.1676508705519; Wed, 15 Feb
 2023 16:51:45 -0800 (PST)
MIME-Version: 1.0
References: <20230215123750.15785-1-powen.kao@mediatek.com>
In-Reply-To: <20230215123750.15785-1-powen.kao@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Thu, 16 Feb 2023 08:51:33 +0800
Message-ID: <CAGaU9a83SfYsShOOTPTQCCHCSt=4E0WuVg6K0OipAyUq73pbrQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] scsi: ufs: core: Fix mcq tag calcualtion
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	wsd_upstream@mediatek.com, peter.wang@mediatek.com, stanley.chu@mediatek.com, 
	alice.chao@mediatek.com, chun-hung.wu@mediatek.com, cc.chou@mediatek.com, 
	chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, mason.zhang@mediatek.com, 
	quic_asutoshd@quicinc.com, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_165149_366055_2123D216 
X-CRM114-Status: UNSURE (   9.11  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 15, 2023 at 8:38 PM Po-Wen Kao <powen.kao@mediatek.com> wrote:
>
> Transfer command descriptor is allocated in ufshcd_memory_alloc()
> and referenced by transfer request descriptor with stride size
> sizeof_utp_transfer_cmd_desc()
> instead of
> sizeof(struct utp_transfer_cmd_desc).
>
> Consequently, computing tag by address offset should also refer to the
> same stride.
>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

