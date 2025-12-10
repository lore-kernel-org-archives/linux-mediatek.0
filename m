Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1250D2CE17
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Dec 2025 04:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMIVlrIRMHzT8RfJZ0XmrU2xGjPLrLeQG/AGz65dD1I=; b=XTleVq3BBlx3GKwCnoOXV+nrMY
	MEVd4rnM7qm9wO1vG6A7Xvjyh07f1QaIwuOKBRnQ9HJqZhf+ZoDcGQAT6Q+ID2UfNl3LElf3BrQms
	24qgBqxCVeEfWtetVNxCshTAuo+thEzS2VQA0cRbc4+6YHcA4Dr2rDZFrIJYqVTNMi1aTHejvHhfM
	aLU8LhuVAjSHTev3/J0KJGaI6ND6K6b7D1lS1eIh7ttdz1AATPXc+mxIib7FlWK0UUSzQiTsNPVdu
	aKTMawE/Q0besfF8+ErjjRPaNlGxU2/3h1l+i43CeqmcwKV5Uoi0xzCyj7VfuoEE3zSnKRlTPfVUF
	vmj3NegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTC7j-0000000F6U8-04Nq;
	Wed, 10 Dec 2025 04:48:23 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTC7f-0000000F6TQ-2GJP
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Dec 2025 04:48:20 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso5019456a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Dec 2025 20:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765342096; x=1765946896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMIVlrIRMHzT8RfJZ0XmrU2xGjPLrLeQG/AGz65dD1I=;
        b=gnqPxxWGZMK1haoPkpLT11uZ6opQEoBuvugQNtLgJ/zllV9FIVrDcaGLhJD/Y3etPx
         OhPxEsaBKfdCi6Kzrtujrdk1erDM4UZ0idh3vwi/B9md28FJPKY1h1gNnGhR+5Ojnntd
         ewXM1rLdUauCjDpVlNMEfFWH8wcxNMim0K77X0iEwCLee+vAHrmgCtvbH6t5k8ApYYTd
         b6tGJ/VIRSIaPdZ4xGiJo395tj8zxZsp1qWIq4qryoPaJodvfopGGFhJhi/7QTqoJfHo
         8iuave2w0Ogh4cEAoqjFwvvuyWeaDrGj1BVE5nt5k7PODH5vg5FWOsTlAeQbQGq5tfvA
         az9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765342096; x=1765946896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMIVlrIRMHzT8RfJZ0XmrU2xGjPLrLeQG/AGz65dD1I=;
        b=vEx8XjPNlcKRSnLZMjBNoF9zrnr/7jFPCrTv0jw9LouNzUmzh/cee+0rkANw+N7w4a
         qhqnv1/iIRW4RWC3ErFrtfXDnMTMZjAZRBxWW74+4WuoR9GkBH2c23MaNPPrf9pY6Sgj
         rmBD7za8Sgegeo2aBCkQPC0hqC4eFGaC16MWhpNNXeT7XhT+KL3tNyaci8lnZB4svvTa
         PJRagGkNx3Uz73LI4ThG88wShfh84ujuNQdXtrKNeyEvLU1SVuKw6LTdmLzfgb3ZEQNS
         r8laILwSQcBn78YiwRTl2vPQjcqgea0+ekCr9B1/Mc4wui6aYwzLi8rBaISOXE4EjE7O
         7rmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgSiIUTEeXQVCWiw4WmRC0eqbiaO0rjacNX/I+jkfMNpnJv5YoEYdPojdV60gEwiJng9irF07HAe9p6KY7Ng==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFDBHCRt3jUSw0L0UTdv8s2xXAP7WB1VrQU/r8NCOBtm36LOcC
	D8CXdqVolgonLbMMMkdX5LcogYPOCXJqM+ovIhNtN6a/krn6BLicYAS9
X-Gm-Gg: ASbGncv3hEg1YGUj3tUfkk5Rp9HmZHHFtdtdetxUG1uc7aesP/OZfbrEIC++9/YVGEm
	7opoaOgIQt+CLdrFATVwLd+zi+rvLAbe3OsoMnuWe6fDC6h1OF8p73DV/cLDnFKqpzFmm8RmdX3
	GUHAM4aipqP70bxYZ1jgUNTLCzlDZSlJ3FrEmWnGfG5hGdfBsT3F7nJedZIxaqx+o0GRZlHo1CR
	arRNzwTkk30T4sj5n3P3uAqIs2F7VTTOTh8kTJ4a9IAJBriKTz+uE447R9oVWK+Ei7KD4zCyCCV
	Dzu6E4Pkj5bZf2lgivaU4n8k8vMZ+uVMS5ta9cR+hTWwZXtQyGlBYtAcHJ1AKP1BIYo3fMFGaMr
	dP0i9XXnOed9/k1D/IT222j/vfBMJJbiNZ9XlXHgye5HKpWHbTBbQe947sq4l7OYf4C8smu0kRP
	oE+pdPr61/hE5NsMuSuo4lOMQT2IaG/fG8EDWZa6NIZdd8F0+67Kpg3orDdaHFIiU=
X-Google-Smtp-Source: AGHT+IGwhF10o8oXBvj6kF3XVHLwewCx7u/bdxSK0ksb+PGLHRX/iWeDMbigiy2qXuWF8UnfAfUzMw==
X-Received: by 2002:a05:7022:4299:b0:119:e569:f626 with SMTP id a92af1059eb24-11f29689922mr965432c88.31.1765342096391;
        Tue, 09 Dec 2025 20:48:16 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:205a:5a0a:c468:f44f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2f3csm72522829c88.5.2025.12.09.20.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:48:16 -0800 (PST)
Date: Tue, 9 Dec 2025 20:48:13 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	louisalexis.eyraud@collabora.com, bisson.gary@gmail.com, julien.massot@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] input: mtk-pmic-keys: Fix potential NULL pointer
 dereference in probe()
Message-ID: <inmlorhcpi5g7kfs45rhtpwq7aatmzxemgnulamvjqxmmmtl2j@vfcd5kndbhep>
References: <20251210030013.913-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210030013.913-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_204819_602000_B1A8FEBC 
X-CRM114-Status: GOOD (  10.43  )
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

Hi Haotian,

On Wed, Dec 10, 2025 at 11:00:13AM +0800, Haotian Zhang wrote:
> of_match_device() may return NULL when the device node
> does not match any entry in the driver's match table.
> The current code dereferences of_id->data unconditionally,
> which can lead to a NULL pointer dereference.

How are we getting into probe() without matching compatible?

We already had a discussion about this in [1] and patched the MFD
portion to not use generic driver name when instantiating the keypad
sub-device.

[1] http://lore.kernel.org/r/20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com

Thanks.

-- 
Dmitry

