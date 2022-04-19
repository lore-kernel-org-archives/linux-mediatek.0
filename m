Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA18C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 10:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ze+4ICEsGG4mqyzMuCgA0nMOZ8NopSYXieatetHi4L8=; b=U8ycscKasoiYm7
	EQp0aPE51aY+y5Ri+HjTbEjHwYVIcchNRMVyRtJERu8Oh7N9/JeFdUKkqAS9ZP6dBEkALiA6DxpEK
	MKYlj2r6fSIwBaVwox56nvpiIc1s8HjvvdITQVXV97AvwkebGEG/8KllXRljVBU5TDCZ8uI5hIv5d
	EcGf9EVWu1OxFsW3IvIDYLLpeI1mI/Fr/tTad9A38HxMf/LB3gyhT6BuexL6F4ahPmJwfiaoo/Z6M
	qy+iibe2y54via7iXRd6E7VIqzicN3vXQZvbhuC4XGYA0LIM3JCfGaGgDrrgE6wGIycX5DTD4JP3u
	lTCtgwx0D74kIUywF9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngkql-002jWU-0v; Tue, 19 Apr 2022 10:12:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngkqW-002jPe-U1
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 10:12:34 +0000
Received: by mail-ed1-x534.google.com with SMTP id v15so20546387edb.12
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 03:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4fzcJSI4oOEyvvnWtTfDgElotLoa5ZRCyODN9ZoDFYc=;
 b=FG2yAAJmlE+e+JJGNL8YIpRAVvDoS5XUHDS3v5TQv4Rpdhr16E7ZVqU+GzX9yQIA5n
 pIRsy6MUX6vZEcwe6QA/1RygGMWK/8PGY4obKR2gvNl7DVSevzthr7FEvcW7q6eXcRU9
 PCjLA5tc+sjbgh0aUwnz5mwZo3UogarS7z0U/sJzjW/xvuwqkrIUuvTOfoXKSJDjERCo
 lunMI6LAuEplt2QvPPEVMlK8UWAZ18wZ/S+ev0mJrX1ghAL2P1AFKl0LwUipaJOe6UeH
 rWCDV6QIV+QMDi6Xc1D4FuHVhDcVhlCQCHDYYKK6DyRC6kfmErIsA5/Twx4TRir4NeF6
 YY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4fzcJSI4oOEyvvnWtTfDgElotLoa5ZRCyODN9ZoDFYc=;
 b=cMrLO9UyzuzX8+k8QkoyDP5gJCeL4fsEvzpiu2deKthrfQzJA8JhtFsWixQKQDoQNF
 gAzlEyh/K/2VBFjOv8YnYW8Txz9tri/su1M5v4udGkCm2EWrMjwkix5mv9MAp3AGGBLp
 VGKK/XbqsN9YuKxUh9FBNiDPbdDhL65Mp4cA4IjhpxMk6Kk7lVPz5dOGcW/xIUri4pCw
 D2Yh9W0tYF9medj2nxffHHmMVIc/qxaJGteIuCYkp+FnvR01+/7+vVMuwmO1wtRyrnOy
 AtuR0DyfVmjTuB9eiTDAe2j3yytuXIfK8dz4K+Q0X+KB0MAsRplS1Y8OdHNon2a1/zjk
 hVtw==
X-Gm-Message-State: AOAM533sT66eIGipgxj/roTxTk2GzhQ8EadcoAPnyRGN0YELCQKxgEQJ
 lSoNjwpSs/VXlrM0Rakx7tlXQw==
X-Google-Smtp-Source: ABdhPJwHU6aPLpAzrjz5Zh03plssXITh4QZGe1lmzwZykI8LaTdTDd22ZXc7Gpd2lL1bn4JHn4Wiug==
X-Received: by 2002:aa7:d049:0:b0:41d:8c82:1a61 with SMTP id
 n9-20020aa7d049000000b0041d8c821a61mr16354944edo.323.1650363151285; 
 Tue, 19 Apr 2022 03:12:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 v21-20020a1709064e9500b006e8973a14d0sm5581177eju.174.2022.04.19.03.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 03:12:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Stanley Chu <stanley.chu@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jan Kotas <jank@cadence.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wei Xu <xuwei5@hisilicon.com>,
 Li Wei <liwei213@huawei.com>, Avri Altman <avri.altman@wdc.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 09/12] arm64: dts: hisilicon: align
 'freq-table-hz' with dtschema in UFS
Date: Tue, 19 Apr 2022 12:12:26 +0200
Message-Id: <165036314214.180327.9388318751451146287.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-10-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
 <20220306111125.116455-10-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_031233_002692_D1E73777 
X-CRM114-Status: UNSURE (   7.95  )
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

On Sun, 6 Mar 2022 12:11:22 +0100, Krzysztof Kozlowski wrote:
> The DT schema expects 'freq-table-hz' property to be an uint32-matrix,
> which is also easier to read.
> 
> 

Applied, thanks!

[09/12] arm64: dts: hisilicon: align 'freq-table-hz' with dtschema in UFS
        commit: 65b96377bf9130617ced41f317f3ec387d3e0dc3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
