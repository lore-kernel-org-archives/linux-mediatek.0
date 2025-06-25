Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABC8C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jun 2025 04:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tI8g9zDb32PRY6Tspe44/dIo1kkI6accqktlnUtJV+g=; b=4H0FUR3UBhoHY5s+N/nOnKZ3Ig
	PZDgaBqVsd7AizxfErgZLGCsmJfAB8HGFDEFFY/3/wYqoKlkVD2HcDHPVzMD1lAYr01uchdHBKXyr
	1Z7koAI3yFsmw0XFlUQ7YkoGaXuskXCNlKL9hWM3AMlBT2Bikg7DKXNR6e84VSCbtvGn+b5O7s4N9
	dHbcIRSxkkYRjCrvOrQcY2tTxJb64v48lP3nrA8/uTgsSmI6NywyGR7HM8Pp9QTpoMHzYLVF+2rdE
	kx8O9Xw3HM3rWNc1OisoRKa5bDQdpKBtfwLEnjX5LOHYRux6rFKEhKPP3QtGdim1AccVbno4NHvQj
	vBIdQMeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHY2-00000007Srz-1Peh;
	Wed, 25 Jun 2025 04:15:46 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHVk-00000007SbR-2dBF
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Jun 2025 04:13:26 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso6618563a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jun 2025 21:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750824804; x=1751429604; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tI8g9zDb32PRY6Tspe44/dIo1kkI6accqktlnUtJV+g=;
        b=WtHjWNwzTBQ549579CquSo6BPl1g9JOSRIMLj4c86CXsP9mwCqRfjbSUZYEGFFLkTh
         /azS/mpfE3+1V2d1KytwVAjvIP9ZaaEw8y52zRXvAzxn0oqwawHFHD5GCJGORXFcLhKc
         +BUQUzAf71Fh4BdqIUALjoLtZgGVzWxfxIOW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750824804; x=1751429604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI8g9zDb32PRY6Tspe44/dIo1kkI6accqktlnUtJV+g=;
        b=r2OrZ1m2NY9TbIZhBB1FdF5hZk9ywvc2ExLopfjDk/yxbZxHWP1d3BJ8EP9XW9ggs+
         fjuSxZo9A4m/3Xu62jcUDTfzlDbo1QyZBgGHm3cpQ4yO8jdKvuhxvTzTx1/oBwvRPeEp
         5pw4Tg+MtAUvZx6CCBmswqPtxekUJv7d2K7fmmijOEHxl1F06YN3hCU0hhyykvY6fJ+F
         /q0v89CICVAfDbreR8mw2VJYalkRFWhECSJaDZ7yqiri+MltAvrHQdqOgSvaaujTjUPg
         NuNbhuoCqr4lBBj08CiUjRy5SR0RcHiZGQj9NEoYUEp4J1l5vbIAFDZqALF5bHd8RA1a
         2OpA==
X-Forwarded-Encrypted: i=1; AJvYcCWofCRx0ImTiwaLwu5TUPKhacBMh4vz9IHXQuU1VtsNRBQH7PKNgET7B8hP+l6ixfZFsxUufrCD+O7CNKbkYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuxRaM1UnJGGziKmL/x59B7JJRANt0gRaaTxlu4GXFicedUkw9
	cFk6LkrBCptN16LVXAkABFtms4isgoKi1GNp9ezdT4jMP7NWfKIe8QaiWH7G8JwH9Q==
X-Gm-Gg: ASbGnctS15Fp/8xXFNRmJGbc/UqADkpIdVURj684oSNXcPs9YAfIeV9ARMI2kv2C8Sn
	/j60YoNExloPhq5s+renxG3ZRZjy61lBC3pdBDpGob1XhWrlkewVOq6ZtLE4LZAnUiMCKdC7EJA
	gOVmBmR9rO9YAGGCC7iYvH/GVCbPOLQZnqq8Z302g7vauweVZhWGxPvwjoyLvhMDG38MffLPwq4
	YMP7wdyr4DP5vWovgbtssRoXOvYPVaQ15xgZpUPgMuQfiVNAPEueGLRf9vWyxKeOtEjP9S1gFOy
	VDdo0ML+We5C9FWsMofo14KUCkXg2lkvOf1hQCqtTNrWYMfuABddQYsKEQRPDw4qXQ==
X-Google-Smtp-Source: AGHT+IGmeaFsOWs9kDGHeETKynTI3T+Va+KM8Ww/Xgly6I5TstSSVul+Q1Qen0PDyH+2QEgJTekrzw==
X-Received: by 2002:a17:90b:1645:b0:313:db0b:75e3 with SMTP id 98e67ed59e1d1-315f26d57f5mr2178094a91.35.1750824803734;
        Tue, 24 Jun 2025 21:13:23 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:301e:ee9a:3fb5:c761])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54420f4sm560279a91.49.2025.06.24.21.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 21:13:23 -0700 (PDT)
Date: Wed, 25 Jun 2025 13:13:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tomasz Figa <tfiga@chromium.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] mtk-sd: Prevent memory corruption from DMA map failure
Message-ID: <cifhvofebjuanprzcs2duv6r22r5reibzm7nub4xfya3h3rmwe@ujpf5wadwh3c>
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
 <kgxqtfdrlc5m5kgprjajt4xtngken2u2locauzhsxm7kcowusa@44ncy4vhy5vx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kgxqtfdrlc5m5kgprjajt4xtngken2u2locauzhsxm7kcowusa@44ncy4vhy5vx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_211324_684459_831D2D26 
X-CRM114-Status: GOOD (  13.02  )
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

On (25/06/25 12:56), Sergey Senozhatsky wrote:
> On (25/06/12 20:26), Masami Hiramatsu (Google) wrote:
> [..]
> > @@ -1466,8 +1471,18 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
> >  	WARN_ON(!host->hsq_en && host->mrq);
> >  	host->mrq = mrq;
> >  
> > -	if (mrq->data)
> > +	if (mrq->data) {
> >  		msdc_prepare_data(host, mrq->data);
> > +		if (!msdc_data_prepared(mrq->data)) {
> > +			/*
> > +			 * Failed to prepare DMA area, fail fast before
> > +			 * starting any commands.
> > +			 */
> > +			mrq->cmd->error = -ENOSPC;
> > +			mmc_request_done(mmc_from_priv(host), mrq);
> 
> Do we end up having a stale/dangling host->mrq pointer here?

Something like this maybe?

---

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index b12cfb9a5e5f..46bb770ace41 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1498,6 +1498,7 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
 			 */
 			mrq->cmd->error = -ENOSPC;
 			mmc_request_done(mmc_from_priv(host), mrq);
+			host->mrq = NULL;
 			return;
 		}
 	}

