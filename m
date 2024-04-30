Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E194C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 16:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCeSwrp/mNlBdqA3TllWYVD3pWNYe1arwo8/uJ5j/aA=; b=Phqf3bVAFBR6CdeHMwIEjT/xDb
	Q5FNqyDJP657bGkec7W0jLnAWpotaASVXJvxqJzpFSMEj5O1dWkglzzU6Qti3euylFXPMx9pqqYzU
	7ehIgYWNlMvJ3fJLeQaitQ8crGC8iPTttYld9nvHgPmObLDMlexXyOTHBgdBiwTfJht3tLfvLCzmz
	uxBigsZv4ne0fq0h0y2RFUVPnLjgpwyPrjQvcLsAnNJs6emrqJLpOQGy2itLFkTw/6wzLB0Qze9ei
	OS6zgVwEshlJPyFXB3mnfQrE3+/YxmC7CsDJHrz6STai+E3X3qKxb9kvyY0x7IQ0NH0nZ1QsaxkI9
	zfcWHvOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1qcW-00000007HwN-30y6;
	Tue, 30 Apr 2024 16:46:20 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1qcT-00000007HvL-41HE
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 16:46:19 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6ee3042cb98so1481627a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 09:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714495576; x=1715100376; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zCeSwrp/mNlBdqA3TllWYVD3pWNYe1arwo8/uJ5j/aA=;
        b=b4CglHTLxFrk5275iyr4rXo3SNZ1upzGMgVgH/30VHUe6idg5Zz95pLJVzaSIY7zna
         n9r9WW2VbvlytP3aXaP2woDrVHgnImiCNO0XGcwWv4blMyUA/UDlc/Xb68T8GPcZZV53
         BMDaWzEWZlgtYAGMtY4lp2mlmg0xwWEnaNDhV96kp6K0+XhPYZZHlYQXkNV247b6oabw
         e/QKQqzBEhkFGb6DzsxLoZ+JdMWB2I89IQC5pNKaiIRcEG2TcMYZlJrzcEJ5N4d+eU5w
         RUN9XgeMWNi8Xd1k8gdkMnH9uWpgCZsF5j8spqMHgR8aRywilMLQq4ZPE1C8WcOE8yiH
         kxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495576; x=1715100376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCeSwrp/mNlBdqA3TllWYVD3pWNYe1arwo8/uJ5j/aA=;
        b=NICLRfbKsJ0mBRqXREbNuHLywjjedX9O9ABFPiuZSD3fNXe6EbBOdYWVTa2Ef5Dbgq
         pslhoeqpUH0mYPcG2pZrT7odTa58lWt5I+xmmS3IDmL/+3K1tkXIXF0t3DvMuR0arMWg
         G7gF+srt29cMm0K1Btumy85hNF0iC592u1e8UqFweKJM7jigTMmk3zEePrdqomCHVGPf
         ptQgJIBUZEgkMhKpA4NbK3H9gWd0/gYnXENKgIHqnij6FRahZ7n1Th58ebwc3sZQz0yo
         Ux++zHAobviL6QpQhEJqEAHTE3kjXGqmmMiRjCN/fg5a/ZPmz72KwKvX37eL/qD9ZvR6
         OdWA==
X-Forwarded-Encrypted: i=1; AJvYcCWqliKASQi72zFxxRoQLQS14OtanmCGjBX8UHeSkrQJxWW9FojFyNP9B2/4+Ad0N92kNBlUgoQ2npNnLRL33QjDUFqZ3BnkNHurPfgkfQ4tWMCD
X-Gm-Message-State: AOJu0YyV+hvjjKdBapfY3DuyajW2Q6aE5FbBmji94R8vrDoOOj7aHyVE
	G4dSv9JI1HotXqTNELhz33fSUGz2i9gBb6MHNvXjNAh8mD6zUsyMoUxsOIkWeU0=
X-Google-Smtp-Source: AGHT+IH8F1std92hvf4fXAZ5Hsa2XfNZ5XXJItRDYaUPxJEOGBg3MYvwiNgKSUGo270d1I21pwkKsA==
X-Received: by 2002:a05:6358:52c7:b0:183:b7a0:8aa with SMTP id z7-20020a05635852c700b00183b7a008aamr432390rwz.13.1714495575942;
        Tue, 30 Apr 2024 09:46:15 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2e09:6862:d789:2631])
        by smtp.gmail.com with ESMTPSA id t15-20020a6564cf000000b006148e35166fsm2898855pgv.87.2024.04.30.09.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 09:46:15 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:46:12 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Olivia Wen <olivia.wen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	jason-ch.chen@mediatek.com, yaya.chang@mediatek.com,
	teddy.chen@mediatek.com
Subject: Re: [PATCH v4 0/4] Support MT8188 SCP core 1
Message-ID: <ZjEgVMj5s62pd3Db@p14s>
References: <20240430011534.9587-1-olivia.wen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430011534.9587-1-olivia.wen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_094618_226612_78180896 
X-CRM114-Status: GOOD (  10.23  )
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

On Tue, Apr 30, 2024 at 09:15:30AM +0800, Olivia Wen wrote:
> Change in v4:
> Updating the description of PATCH v4 4/4.
> 
> Olivia Wen (4):
>   dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP
>   remoteproc: mediatek: Support MT8188 SCP core 1
>   remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes
>   remoteproc: mediatek: Add IMGSYS IPI command
> 
>  .../devicetree/bindings/remoteproc/mtk,scp.yaml    |   2 +
>  drivers/remoteproc/mtk_common.h                    |  11 +-
>  drivers/remoteproc/mtk_scp.c                       | 230 +++++++++++++++++++--
>  drivers/remoteproc/mtk_scp_ipi.c                   |   7 +-
>  include/linux/remoteproc/mtk_scp.h                 |   1 +
>  5 files changed, 225 insertions(+), 26 deletions(-)

I have applied this set.

Thanks,
Mathieu

> 
> -- 
> 2.6.4
> 

