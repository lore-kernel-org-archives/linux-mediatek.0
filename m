Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41423C87FCA
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Jul 2025 03:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YELIpOTk7v58USyg3NWMuW2KC3hMjQSyAozxB3de114=; b=bX/npZPtyLLvuFvl4+KM23unOz
	zYqrfwUYVR7hP3Gn1Zve8f+FcqOMdIf4FJHJRN6uJ0UX54pcWdJzJlgFol6T9URqjTNfqmxUeTDCt
	x43fH4da6aOpMWv/s94tlXdB6rVZ6Q2c4b9mfXvIiPFw3XRnF7q6R0bF2DMuu0BA+CDGXWMITszRT
	a4KXNEiKbcdihmHABqF67GQURm1jZl1LZYiwtXqmmilGshb1G47NGquXU5eK1qXwcBb/MqQqBjVaY
	QRWUFTqeTg8TNzxRcZOrppxcPT707h2883lFQQInX38YSSLOpDlklHhvZRBOcY3iRnzbyGtgw43c8
	49TUrEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKFz-00000002qQW-2OIz;
	Thu, 31 Jul 2025 03:47:03 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKFw-00000002qQ8-0qzI
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Jul 2025 03:47:01 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-4fbfbda957fso182899137.2
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Jul 2025 20:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753933618; x=1754538418; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YELIpOTk7v58USyg3NWMuW2KC3hMjQSyAozxB3de114=;
        b=fttQDdkEeCnF2ek7LCIAxcm2nTF94vExe/FO9vy6eRHSTsuWgAQa0IGKB/QqKfgEeK
         q8A/7LSXV/BzBystiebtXvQ5zyPeaXO/vz5NBd2/LKr44M9gDIGisL9QexUnGNoabvvB
         JzKLUVsn9lkPPTFKmxrNnhCZqDpzuZioLGXmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753933618; x=1754538418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YELIpOTk7v58USyg3NWMuW2KC3hMjQSyAozxB3de114=;
        b=ci736Xe61HrGefYwEHaWjqrNxngau3Y13/orxISuzCrWlXSrDGkqAaAxxQpm8mjW60
         aZAYc6Sq3b16T8bxirVKXgTWwBRRXd+fG58jLwumzla54gbWqDJW+H7WgqJ0kzlTA9hl
         3b4m/wtwtYEAg0B4ib93Cp71WnKYHXDWYcDU3ZbA5870dZy6B7BL/fANNM3iJk5Qdw/Z
         JoCyLrINIAmphowAo6hPiNEVv6jzoPg4++sw8DRwIQF5dRLFz3iav/zECEtUux0aDLp/
         XWLP5QE5Box9y253GlxH0CHaNi+EjkEMAjGtxlKbheP/VO9kTleKLAQK2QOYuLu77zcX
         szDA==
X-Forwarded-Encrypted: i=1; AJvYcCVu9oPgLXSuzKV7rV/60b6XOlgZmnk6Hi6GbEqkZF9xOyN2vjUrTpPgzEnNq4AQfjuLaYPhpVguLPZB/KepwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFSkrDYuWfDiWlHokkgZnD+Xdx3XEVo9A2qixXI5qPqxRh4b9h
	QZxR/CPQnOenXw/TwFADlRenhTWICsly4F50PNmAm3pdBcjvEjXhItnG8dOnWq7+D2XZ2aUhWFF
	9opA=
X-Gm-Gg: ASbGncs6xHWPy6IRnnZ7cG7zhgLIAB68X5w1iF6X3jEgJkvdeaW9Xl4dGoYM9VJ8XwZ
	JjwT2uj8lRP5E2CYOKxRk4FtEbT5xyfei+4KxPlyYVvLGjKkTvyohbkf+jcKEMRA1Y6wKS8qMp+
	va+pHAez0IPhgOcGAGNLN6LqmA6b+xB514xa7PNPiyB1HPcG5xyBqNERPNyMRD1PhfTULQI4f/c
	+mUtlFyQh9tmYz9JierJlDS10LN0a0GKtqUQJLfmfWbxCIDg/moAVxB8k6XFDHqdNCHJqxb4+4l
	cyCZsRIZQHia7ExxDov3RS5kghPFghdgF01ICW4C3HX5a0/aEFosf1r9seNEK2o+3GBoa96l1X9
	u5R0Cn9nVCPnSYg3kHatTZWWL6eyh3I/ifUnE0nP4LFxLUTN3HmoIQBNHYAOEdV4sGiom
X-Google-Smtp-Source: AGHT+IHKdOh87BL3hqSBbrt2NikrY4JpAyJjinMCOLx+AKqOw+87kj+Lz2hLY1APWvWtJLBREEDe6g==
X-Received: by 2002:a05:6102:2ad1:b0:4e9:9281:85aa with SMTP id ada2fe7eead31-4fbe7efb074mr3289977137.1.1753933618416;
        Wed, 30 Jul 2025 20:46:58 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88d8f357a47sm204123241.12.2025.07.30.20.46.57
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 20:46:57 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4fa830d7f4dso162316137.0
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Jul 2025 20:46:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXhT4IkAGavVi2KTunfPcPe4uYvqlwqI5PPpcySUUqjEq9Oj5gNyUCZaTlVxsn3tTqe6PaieVN0V36C778SVQ==@lists.infradead.org
X-Received: by 2002:a05:6102:3e92:b0:4fb:dde8:76cf with SMTP id
 ada2fe7eead31-4fbe8753b11mr3988803137.13.1753933616614; Wed, 30 Jul 2025
 20:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250730152128.311109-1-laura.nao@collabora.com> <20250730152128.311109-4-laura.nao@collabora.com>
In-Reply-To: <20250730152128.311109-4-laura.nao@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Jul 2025 11:46:20 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj9eVDxSxPuntMjTSrwhVAhVLMs_s0aR+COQjM2HB0S9A@mail.gmail.com>
X-Gm-Features: Ac12FXyuQfNec5PpeCVYeU9gZNhVWy6e9AZ1QYJ8r0Oc3K8xhe2Kp-euR4Zabx0
Message-ID: <CAC=S1nj9eVDxSxPuntMjTSrwhVAhVLMs_s0aR+COQjM2HB0S9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] thermal/drivers/mediatek/lvts: Guard against zero
 temp_factor in lvts_raw_to_temp
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
	linux-mediatek@lists.infradead.org, bchihi@baylibre.com, 
	colin.i.king@gmail.com, lala.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_204700_257661_D4E943E1 
X-CRM114-Status: UNSURE (   7.63  )
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

On Wed, Jul 30, 2025 at 11:32=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> Add a guard against zero temp_factor in lvts_raw_to_temp() to prevent
> division by zero and ensure safe conversion.
>
> Fixes: 6725a29321e4 ("thermal/drivers/mediatek/lvts_thermal: Make coeff c=
onfigurable")
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

