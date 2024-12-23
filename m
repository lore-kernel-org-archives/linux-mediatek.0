Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7925E7718D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 06:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKcQgz1pvN7VtoXag8ASypTXkQf62mHyYLX2dWorKN0=; b=wXhuoyTt3KOEsGTAxhKikjvQjl
	1IL2zfh4bux7h75Rjh6sOlZSALLQpTSrdLbpj3VQ0EFjCcYinWoAOO/P0GiHeZcSfiZAn9eIfaxnx
	ETjESN5ykiX6WZFcVZ30JqR9Vd3TRcsrRM8IVy//c2aoaknijCzOGC9uuLAQ/LBVD52nIht2puw26
	cThIFMfUxJ/c7BbZnG/Gn3vO+ZXeptw0762eWMRTY+OAso4dwaBppQtOh1JlvL97858mY0fL38TEr
	ZQoQDvgHHp+yDcZEB9nLY+FzzELqPSlEUwUJhmcRjfSJ+ENmYxRN+Blx3MNDlrs+gduFvbDx7dgz+
	HG0sFEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbW3-00000009NLx-0pJx;
	Mon, 23 Dec 2024 06:02:07 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbUq-00000009NB9-0WNb
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 06:00:53 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-728eccf836bso3235592b3a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Dec 2024 22:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734933651; x=1735538451; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKcQgz1pvN7VtoXag8ASypTXkQf62mHyYLX2dWorKN0=;
        b=zjHEI0mqaYpX6CYZkhN+d44B796oIJWGqhc1mVzyaaf1CXyn2usxc3gEBLvRtXphCn
         m0m7eeil/aMpo7x/TkPJGGinJ0sxtgwJhPzCxnYsqkHwAAMEa/enA8opepKFE3Q+pubZ
         lX6YnRhMfBzbLp/1UMrMKboqUIrvThF6GoUOkqwQvRtQbfvTeoAaO7+cHWBaNsyjMsme
         wNGdV5nLz9bonclhkfqd9yGJzlTLorFPYA6cjYW8hwx1PKB/9fsC7V1nYXoxfbqOC3fT
         5r9TJsdlU+J/kccQq3fY4u3wu3eZWTycEaPAOb0iLSxBUNYvdqZjF2n1y/sI3wdKB0XH
         Mmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734933651; x=1735538451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKcQgz1pvN7VtoXag8ASypTXkQf62mHyYLX2dWorKN0=;
        b=diB3zDlhmsJy49W1/K71bkBRy0miglLpQP4OZUuMMw0kKevmKdYBgPHmFmMUJHO6V1
         JsGeKEVAcz8sjQNtbC0TrlxFPNlBXZRKRd4HVT77VO4zR35etcjX5e09U2g5eLJrYfDx
         l9rkeoFy6X6T2i0IV8DhsnxdHcZii3hbj2iLH/V18oHtS+lLg5SPHwyI6L/BLOp682hc
         uJ1d/3n5j5NunZ9aYWgX1pudQfPm2oux3pVRCLXdg3/FgUxUiiBRInTJOQrLq6y8Zbn7
         UKz/dIbjYquJKR9lEEpVG4UQu+GYtBElxSlP78BVDzBJlRvMSw/Gv5YoCGnw8h5PZZje
         FbXg==
X-Forwarded-Encrypted: i=1; AJvYcCV9XTNqBt6UzUs86yZplGmR7W7a1fEHiGdmZvK5+ISEXx/reCUasJp0T61N+XEkYBrYAHU76bfz4etRnx1KVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlGOl9MDGIZQax9Y3xDv6ZqjTqhCSDMnJE3FB8T09645ZUpp0o
	owUObfCuG1mLCayupBesFaOg5bzR5xUYi9OOf7lPaldawlwZZ5a6A0vzJDmQ6w==
X-Gm-Gg: ASbGncv11vJREh7FnWBhaRr24E1G4mxC1XyHN5ouKXjjXKNno2epRWJzSlxT0K7ZMYL
	aaMck1JuxYO2rdc7I7NKvqoqSQt1nn78m2DmsGJYEPdT5+x+rrhVb2kq7zIbqQwL+0Cw1B4e+oG
	ScxLxWIN+JblmD9DFQDW6DNw5W6n5RltAHUAizu/cY5WTCrkJcgcmq760WP980X8NPar3TsaMdf
	hkRFn1cRC5NypHOrOZcGX/96VeX6jVdYZXquPhb/ZvIzPfqWAL2afW55c9k09fpxtQ//Q==
X-Google-Smtp-Source: AGHT+IERaNb+diJOrMJS3kJCheBXP7A+vgDiiATXj9Yhh4r5dUjBeEQNITExnSiIEs5tsr6QTyh1dg==
X-Received: by 2002:a05:6a00:410a:b0:725:df1a:273 with SMTP id d2e1a72fcca58-72abdedde94mr17676087b3a.26.1734933650659;
        Sun, 22 Dec 2024 22:00:50 -0800 (PST)
Received: from thinkpad ([220.158.156.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbebsm7056173b3a.114.2024.12.22.22.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 22:00:50 -0800 (PST)
Date: Mon, 23 Dec 2024 11:30:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: mediatek-gen3: Enable async probe by default
Message-ID: <20241223060044.4dux3xym7gjyd3pl@thinkpad>
References: <20241220145205.1.Ibf2563896c3b1fc133bb46d3fc96ad0041763922@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220145205.1.Ibf2563896c3b1fc133bb46d3fc96ad0041763922@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_220052_204814_4418CDB1 
X-CRM114-Status: GOOD (  16.11  )
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

On Fri, Dec 20, 2024 at 02:52:05PM -0800, Douglas Anderson wrote:
> Like other PCIe drivers, the mediatek-gen3 driver has a fairly slow
> probe. Turn on async probe since there's no reason to block the rest
> of the system.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
>  drivers/pci/controller/pcie-mediatek-gen3.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index be52e3a123ab..49512786d5e4 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -1301,6 +1301,7 @@ static struct platform_driver mtk_pcie_driver = {
>  		.name = "mtk-pcie-gen3",
>  		.of_match_table = mtk_pcie_of_match,
>  		.pm = &mtk_pcie_pm_ops,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  	},
>  };
>  
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 

-- 
மணிவண்ணன் சதாசிவம்

