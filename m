Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B2DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 17:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AlSG11Xz0KEmY1J4qxRxusy/iUb0jY7LfF1OTYlmoE=; b=eqh37VQAT8lhzuavMXcL6wvr8y
	B02kxjuMZSxHmNhKwkr5oTOmFh2qio7I+Z/immXfWAeMOEw5NCJsAUJ/GkDocXowUXc+2q0t+bp4E
	dA2RvhL5XWFWlkLsS2Bq4Py6I5Z2TRXdIVjgDUNjG/HbrRSwEsf2ywFeoqm6iLtdlN+BTiBU3NQ2+
	SZyCUfIW23MBoI4J0MGJSbnNslJE3TgXiTPlZynCPIXR0IJ3+60NrbroKnTazEmsXyEBohOQHK+Bm
	7Gnn6PgOZU/+G+1xfJxC5NA814CsCdKICmQ59Hn2ddwyO9iRIgb+HSln6oQwhTXpu4/p2rK/QoxRy
	7Q4kZ1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUOt-00H6UE-EZ; Mon, 18 Jul 2022 17:19:19 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUOq-00H6Ru-7v
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 17:19:17 +0000
Received: by mail-pj1-x1029.google.com with SMTP id t5-20020a17090a6a0500b001ef965b262eso13275067pjj.5
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Jul 2022 10:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6AlSG11Xz0KEmY1J4qxRxusy/iUb0jY7LfF1OTYlmoE=;
        b=vEheWttEDztzn0wX59F2KAGkreCbHs3di+tKqkl4IAPJ8k+nkONjCaOPX0ur9T4LFn
         HrVp5kPLFewdY8BqiqJF/XavfQqqwVJQWl6AOBEy+YbzNGvJwMKXg6qBhrucJC1j/d2f
         /eixL9KXtAUfWaEZ6j5QcDUsb1pTei0QpfJACiz2a6oePiDheULjMRKUm+wzPiSz6E4w
         0ZexggTDJG0McCTRtrAfYvWd0L88p05aYt0yWRNZGz/f1isLq+nSOc9bpNoaOfCzhY7g
         YNbtNy9apzKYpB55t8+rdEKFWbEX3NqHfi3QUzYz5acc7L66jsN9JI8C3C/T5ZcpnnRY
         PSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6AlSG11Xz0KEmY1J4qxRxusy/iUb0jY7LfF1OTYlmoE=;
        b=uwh8yLoCaBh6Bs4hGcG3h0cd+ydUE/Seozbf41TpfwIbFCCsgCiMXTwcOxb8ZUs6kT
         +LQBGgkQ+bJA4Gpiq1fARIo+iCwJmr5m0Q0Sy6o2/jTN8zTeYc3Xb9unOI20fST6on4s
         5NJsZt61pC8KSEvhYpO35MmhX1ZnKbHxLZ3LjLhbfGkPx4krjQhj/DlGdJmiyiS4/Zxg
         B1CphYmZELFeUW60S8YP/z5sEbhfpHIV9RKvxsSAOQieYoeYhs77BGQDkJIzg8zVDxXT
         qMYNp6upOhMSszdWx2tyfLoBx7IPKdCHQgS3mOD8WzW4+CXjxLb7xjI+NlHfXH3Bi5a+
         qYcA==
X-Gm-Message-State: AJIora+qZxhTdaFXQdc/Ru3qwfYgxFpuwzwn79TwbuqkVjdhQV0Mtslh
	yviLHUMukcggW17AL6Kfj9fMNQ==
X-Google-Smtp-Source: AGRyM1t9xo/AS/NKpz2t46SlZm8sa/vdqDfuyTscDK82ci703AzuOy6ziJl8eg57k0SFP6nQ2Qy72A==
X-Received: by 2002:a17:90b:3d85:b0:1f0:7355:734 with SMTP id pq5-20020a17090b3d8500b001f073550734mr34853999pjb.24.1658164754519;
        Mon, 18 Jul 2022 10:19:14 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id a20-20020aa794b4000000b0052abfc4b4a4sm9830384pfl.12.2022.07.18.10.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:19:13 -0700 (PDT)
Date: Mon, 18 Jul 2022 11:19:11 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 0/2] Add support for MT8188 SCP
Message-ID: <20220718171911.GA3331732@p14s>
References: <20220715051821.30707-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715051821.30707-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_101916_330172_F0B1FA93 
X-CRM114-Status: UNSURE (   9.96  )
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

On Fri, Jul 15, 2022 at 01:18:19PM +0800, Tinghan Shen wrote:
> 
> Tinghan Shen (2):
>   dt-bindings: remoteproc: mediatek: Add binding for mt8188 scp
>   remoteproc: Support MT8188 SCP
> 
>  .../devicetree/bindings/remoteproc/mtk,scp.yaml     |  2 ++
>  drivers/remoteproc/mtk_scp.c                        | 13 +++++++++++++
>  2 files changed, 15 insertions(+)

I have applied this set.

Thanks,
Mathieu

> 
> -- 
> 2.18.0
> 

