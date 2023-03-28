Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07208C76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 07:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYSKi6P9F33q3cGk3dc2X+3QTPP68ecCLe041fZqdtM=; b=BOrsCgDmNZnCO5vrwhKORrpq2J
	TVYSQmwJV8D9MraRA3jAVRqFMrr5GQkGDpnpN5aBZnHPfxsKtDtDagSfFZIkIAiMtQJXjx+oimGWo
	RG7xrdp4efJMFSr+uywibR8q+97NSx4Bc/JwiZIaHYl+7H361qVh7+/jBUU1UVt6J+jzTy/WNn5al
	ZQjfERQddZFsMFlZNjvE+vBkHLZk98TzXMe+Jyk2w7aLKz9/M4Gk5GXssMLh4stTPDFzmxPkvbi5p
	iwPSIgQCUdhJ+Elu0cUr8ICRMXpKuX2qPaxTudzTc9oki5lPTEey+Kjdr4ByiRG7ZqV4X6mJYHDJe
	KnsoXiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3wG-00DUqD-1d;
	Tue, 28 Mar 2023 07:40:16 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3wC-00DUoo-2q;
	Tue, 28 Mar 2023 07:40:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id h17so11100032wrt.8;
        Tue, 28 Mar 2023 00:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679989209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qYSKi6P9F33q3cGk3dc2X+3QTPP68ecCLe041fZqdtM=;
        b=HbSxQr4r8Zf3+yFQGbqcSxzOtKd8vj2cIF9+ve9dHjUlZoMwR8DYHXDG3+N4uRe0Vd
         y0tyA33+FCOrO1XVTYqLMCQaVei6b+K0kcXheOPsVWLV4HEKyUxEQf1Z835o14j9bacp
         ghe9VyKKvUiP1a7uUEtkJuyjM+AOUdFwrLJWU7Q3Au0XD5DV4t0QUX5irMgq4g1YTI75
         5fGfeDGJnMAmrLjC4zaBRLAACxa02wIPHGF48zub+woOFOA0kqTGgHJq1xBs+FeNbLW7
         h5cPb4t6yvBDTFgqAtUzrgUlRqccvDftKeSJUDmZZTvjxIVqSo3FDfDz142jvg4L4KaV
         AbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679989209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYSKi6P9F33q3cGk3dc2X+3QTPP68ecCLe041fZqdtM=;
        b=2v5nahCadkJO+KRCi0TuIG9bmcMtajNl6D5NGkwGrfyhUmZLEVIrge5Ne83GblT2ha
         VKxW/p3RAX0k4HYcqgNRnspSJkKn7d7K7sK90gQ1XC/t12qZzJKwBnZ7xLzCYid6iL8b
         ZBQddrIwo/4oKx6m7a5+Bg2rlfbmkMiiFxToG4WwUq2u2+JfhTlAZ4T8i6bFXU4DsN04
         MccxKPq9ZXL4I13fynQVvrICOlba5/jtTyZDnYFuFLLHWelHPBB0W/C3jj5DGqxq1FkJ
         FAvMz58lQ143+A+OW9rQVhtX7s6MXXm/ccHnCzhMGq6YWQRFyhP8kOL6CnrrSu9xbRme
         eaaw==
X-Gm-Message-State: AAQBX9e+Kh+lLuNzecQ9+oPnfVQBcBwX3vAuxWr6Jls8KWO/r7z8/ChE
	NMKpKnVTfaO24ZpjM5Ngd2A=
X-Google-Smtp-Source: AKy350ZblYUnLPCJxBsWxVjLmOt7Surp3uSMJdu3VZiB82QN73WYQMcps/WK/CciM1DKpYZAGC5tMA==
X-Received: by 2002:adf:fe45:0:b0:2c7:d7c:7d7 with SMTP id m5-20020adffe45000000b002c70d7c07d7mr11055389wrs.22.1679989208657;
        Tue, 28 Mar 2023 00:40:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k6-20020a5d6d46000000b002c5598c14acsm27215726wri.6.2023.03.28.00.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 00:40:08 -0700 (PDT)
Date: Tue, 28 Mar 2023 10:40:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yu Zhe <yuzhe@nfschina.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	agross@kernel.org, konrad.dybcio@linaro.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	kernel-janitors@vger.kernel.org, liqiong@nfschina.com
Subject: Re: [PATCH v3] remoteproc: remove unnecessary (void*) conversions
Message-ID: <4b64c2ed-b3a3-46fc-b5c7-3c03b30cd8a2@kili.mountain>
References: <20230320061157.29660-1-yuzhe@nfschina.com>
 <20230328015749.1608-1-yuzhe@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328015749.1608-1-yuzhe@nfschina.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_004012_922206_C24DE39D 
X-CRM114-Status: UNSURE (   7.78  )
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

On Tue, Mar 28, 2023 at 09:57:49AM +0800, Yu Zhe wrote:
>  static void devm_rproc_free(struct device *dev, void *res)
>  {
> -	rproc_free(*(struct rproc **)res);
> +	rproc_free(res);

This introduces a bug.

regards,
dan carpenter


