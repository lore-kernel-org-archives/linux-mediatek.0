Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A97106ACE4
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 20:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+y1WK9bKYEMzE5cM7mHmluwniDdPir3jTdVAfeucGs=; b=eZ2MqO6UD/v4Tm4RI53r756yju
	uDJG2qpLNtO9mGhneravs8rftEr3pAjmaJN9401ooIGuu28hDjrl4gD27quOxq1eO3lRSvvWirCHf
	hZgTOGslaqfsb5zmIJRH/r43M8YCsVyCCHKNT7EuibMM1x2AeG8HD31DzRCUdb61sE/FNKplVsasm
	Dbzxhve3XM/bt/n4dMWel73OHFI+IWm2AmUaP5d7TNgk0jb8pUlic4A4e4qgoAqtbe9vyUoIG1HNL
	CrtJ9v+lOhSqNBdGh3XwcK3y1gTXDQO9GCbtM5UBulbr9xZ8OwnseSeD9xDI+MpFCTJgPMlsOnlx7
	ufUZZaGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJO-0000000FDVx-3aih;
	Thu, 12 Mar 2026 20:07:14 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJJ-0000000FDT5-3TCO
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 20:07:13 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-4043b27ddeaso951797fac.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 13:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773346028; x=1773950828; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+y1WK9bKYEMzE5cM7mHmluwniDdPir3jTdVAfeucGs=;
        b=pumAnSwMDCXT8b0obfuLwu8stNEgafMp/4CuxrDsFOX63suGKPRX7TltgMAJ1L8TmH
         EYnuVUILixAJwgHooewxKCt1ja4sUkoa+I0qXe91mqCGKB8L1pIbKTh/74h5UsNdBcGf
         SXPWLUsUYJrQcMWjAGhLv0wFQRB0cEiFEQyD896XDf/VVXOGbqDIiY13CBLXkObemV6B
         a5pSYkrdpr3pw+Ihujyd9WaHIo+WtAxHx/wVgPwZkhydxcBd3O3orOSlJ3pFonbXVSdl
         RrBP3XQY6RE/KfphewpWWQ/8wR8qmlSkkspZZatr66kccgR+7h9pCyiIhv9Mw7T87+QD
         RQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773346028; x=1773950828;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r+y1WK9bKYEMzE5cM7mHmluwniDdPir3jTdVAfeucGs=;
        b=nfPqnAHD8v7qoUQIjzE67XNk0Qg7ejeieb5Jv4CZwyXrEWK7IdPRLTnbMen63nTWrS
         9XRoYd2aEu1G/t/cUvBNsmfCQW+IG8fWuJQqWc3+3dsxkBteXqcIjMR4F0enNzv4Z51i
         JMCLIMy5wyLwUAzVUBc9i7FQSM5rh518AbpHyLbTtF7PNBmiXMWuYXMCIQWjy9GLtbUW
         2dC0B+cAHv4V4KllpQgGb587s0d2Ah2IaL7bwvYvZBbI9MYWdRokyDaViOgbBBNuodEW
         JObVyYCI9tQP/X5GO3iMfRO0gXEbW9aXxaL6CvdLuVpC9mtKEGpx6qkd5+VMaZEVQXE5
         O28g==
X-Forwarded-Encrypted: i=1; AJvYcCW4fx9C5xe9LE6NeBkswU+5mtnxD0LPe9/qQpIZASLo5JecsDovOB5y46QboPI+9VsNvJrpJAI2shYp9CiAGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwYIydNcMOt5k4SNQrSMymw9DLFMTfRmb0MhZM+Bjakdpi7rYR
	tybdZUeQiEQ18LjwKMFOCDaPEuTJ8PbCfhynrIPSr3V1f2lBNUX4Jq/+wkpNUjJgPbM=
X-Gm-Gg: ATEYQzzCLftFqi/3oNkS2eKjRzje+JxiE6hAPNASKb4yqKc0E03TGS5cv1BicYY/qWt
	fY/ZRsRD8KXtmqrM7vGWiL1CeXJDkjZTuD/ODFiWW4a+jppfdtwRFayp60CBniA+1LR54rj1CHz
	lbmJ8fjtgoK3vN3mhoZn76Ck4KjUW2vVjlWn6fg82LhA69U6MbT1hmC1Tip4oEAWPZ9hipVPhj4
	sXyFfcHuZztfS9mZB01GbkAgX/i1dc0wuuwWC8IHjjgVt5EBRD14jSHH2jR3hhUT9/fm5I8bd6b
	Py4DaokeRJA3ijs4QAWF1HM1qqZo09GqHp/1TgPpdoSiOSBh9Rc4Z5fZWcOiz/GasSzpUGUVq36
	Oyt41WPhFFS0GRP6GCyfDfSFHdo6VPD4Y5HHw7VKYwb6t+Gta+8XBgXw05XIs2OdYp6/hNXNB35
	Bbhk7YmWGounZJ0j2gyvETqdMQ1K7W
X-Received: by 2002:a05:6871:3864:b0:409:7a01:6e2f with SMTP id 586e51a60fabf-417b906d7e5mr406126fac.11.1773346028068;
        Thu, 12 Mar 2026 13:07:08 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1f95:f82e:8747:8137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6c7885sm5600081fac.17.2026.03.12.13.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 13:07:07 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 00/18] Add support for MT8189 clock controller
From: David Lechner <dlechner@baylibre.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
In-Reply-To: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
Date: Thu, 12 Mar 2026 15:06:36 -0500
Message-Id: <177334599652.4124794.2284323207748123029@freyr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=515; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=lKJ2mS8qshYtbORsyK0ngNUDnpsbzs9HMnnIPPn7MQw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpsxzPi+0zWeulMgYec/oNHyb8sbOm7PTreogHt
 ekbB22puQqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCabMczwAKCRDCzCAB/wGP
 wDfIB/91n7afDNKVMM1YVnaRi8vpX9xoS/2fQLT+wzZC/3m9wr58g42+Hy7F1+SywRjBf8f8CWn
 BlwpL0zR+GBEnDlPiWeCojMa/oNotD6CWbl2gXYC33sllryI2rkGy18PxfunAxpNBAm06vWz6Lr
 YvsvuBJ7kEUcqf8+DH+bgCKLL/2fWxaI6Cpj/rggJGywF1rJMvK/5qwFPiuIUVDAV3xRL09Firz
 uDocVTpeY9TqTi2Nq1MU2MfD+UH2EKd/SzRjDlgDoyOmTefufsLWnJCeARld89Zvg/NIOTGWdkC
 WVTaGeyWsXb+6V8GO7rcJ8/3R5W+W5sdRGFjjE3ewiwYd1Gd
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_130710_141906_C00D9886 
X-CRM114-Status: UNSURE (   9.15  )
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

On Mon, 09 Mar 2026 20:04:42 +0800, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Changes since v6:

So this should have been [PATCH v7]?

> - vowpll/aud_adc_ext are fixed clocks in dts, remove from bindings.
> - Remove unused clocks (clk_vlp_sej_13m, clk_vlp_sej_26m)
> - Fix confused naming: vlpcfg and vlpcfg-ao
> - Correct naming in vlp-clk driver: vlp_fmipi_csi_up26m, vlp_pwrap_ulposc_sel
>

-- 
David Lechner <dlechner@baylibre.com>

