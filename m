Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3F3C48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 21:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fvj5uw7QbenybDHCLaJHTEMXDIGnFZ9H+LRfmuRvVXE=; b=TQEND8/KnMQ8e3
	wI1x7UnSqRmXxaNnsPcR5vIujNhCftCO1/wuokCOE1uAKoBRmviecgodrDqA9y572MiLKX3MkdhtB
	7oVYOO6UqG0xpkGNJ8wcpiSm6M9Nl5/MIUM+T1gXHLp5hRkPYm5fsc+ysbRXnjjBZXI9fiHyj+il2
	zSBGcmduaTofmZ4qVGnEqJ62CERFSfGEHa6A0XHUDnX0ZWB3eH3mqFHq6JP/0Fhmuz1ts2OKZLvJ1
	QFsIwFxuwVI18rHEsSTvqxUUMJoyE+1pSsBl/kyPKL0EzTeSpmtuo/9FN0IO++WNmfojzS8GhQ8N/
	Jl2ULKgwPlywDjC3zk0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raMZy-0000000EGMr-1WM1;
	Wed, 14 Feb 2024 21:14:06 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raMZu-0000000EGKc-1z1V
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Feb 2024 21:14:04 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a3cf64f33b3so16775266b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Feb 2024 13:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707945240; x=1708550040; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fvj5uw7QbenybDHCLaJHTEMXDIGnFZ9H+LRfmuRvVXE=;
        b=cgxdmRlV0L2s1mJg8RTDmv5BQC/1bOFm36pYqb5/cA3nS2W2NUSlN7i4jrPWpiEZdi
         UkS3FSXj9CA8CJtDgdkd1P43pSrbAYwqfJp6JCrgKT5olePPKTm69U+uN6MJlCRdD3Eo
         5nZ2SngRadzY0N8kKSi5fbCFPdyZWn9Yd7ZkjBKxpM+OT5FLs3AlBbnPhTIQyluwrDbo
         HUJyeDZ8EsPZ6B6aLv+KHFqnn9PY/rTQojC6eN7xQmga75ho8J20cEsPLLMWf5AtkIeK
         Aclelp9AIFrxUyjZkSc/6GWhzuVqpdw6lnj5T8UvP8Q7I+W3NaeOumCP+dn9KbbbY3gY
         biYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707945240; x=1708550040;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fvj5uw7QbenybDHCLaJHTEMXDIGnFZ9H+LRfmuRvVXE=;
        b=lDJax/oCqFl0YMMoQsJHWbYDCRFfXFLQy+mM3XVurK3T/16sJPDkvZQCRLrZNGcLOe
         QagGNgf2bNla0gzVIzj0DM7y2CmzGApgi+trpw6CTp5VQW1+tEGWBLphKWmGZbG7b7lJ
         aMME2FJV2NEbX/oI8AuZbRUWL6WPGVaZHnAissUWx6Wm5I1duDIL2wrDM8zwJOrcP805
         IPZKu6rN3OukXtBIA/4isOHycH8tSIOGlq02WoYjME2Q8gmA8kse9j5RWesQs4imTHy4
         /NaxfhEthUBAMZO894wTaedPwvt0Lo3RbvovDX9zmpnAGfjgVbpYEBBen9WvtRygR0oj
         9AMg==
X-Forwarded-Encrypted: i=1; AJvYcCWMsRT/Q8HyBgl3x4epfxQzv+LD5wMmPHU/UIVoVpV8RTQwrChrzXH2CFRGO9//tGWdgRVISjvhDoWZvMTQID3q3HpEOv5V2rHuJeS80Q8SpPG5
X-Gm-Message-State: AOJu0YyFEyRh9lJrdxZ0vuuNJ26Yb8pWCXoFdV0Mu4RyKk3D3EEYkeH8
	om97hadesy/FNZ3rPx4EILiWSdScAtpLV5bdu2mUTDWL4cMbcYFCTVLZGJoPOkM=
X-Google-Smtp-Source: AGHT+IEshxCe9h92dXHRhhELvUU8nvv2IO+Or5Eq8ER/XHd1CxZ/osf78IndNBAnN+2h6ZNmpchPBQ==
X-Received: by 2002:a17:906:3b0b:b0:a3d:407a:d270 with SMTP id g11-20020a1709063b0b00b00a3d407ad270mr1773296ejf.71.1707945240118;
        Wed, 14 Feb 2024 13:14:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUUtxBbZ4xOCWIIiBuUka3IHzQRTxkhbwtSe59/R7kG46dv77j6lQQIJFGG+FjQH9qMXIXZklD2dBX/ptB/c6dMkcz19UVdEGKh6yuob5teE75pbY0jMYZQlc3rPS6qRkpTuaNfMglHzpWS1vK8RmAB34i9kklIEyyxo+LzOWz+KJz8+LTzhrG2G7tHXvx9I7V3Gh+q8ByJAzZNTTt0B18GE0BRnJcdaoxQCzKb7ZMrLmTqqbGIbkMMnSJLiCDHJdWfRTWeHLR7Dsc3K8dVonc3YoigaO2CAv0CqEvjopRahEKUik0YmCjOxKQVn9cCwOw/3Nv6pJr7nOWZmwJBxpr+gcjOcKnnVIuS00zgovV0PzG5qCW5SVogR7XnRMYlHa4AorRBHjta5EVzFLg8K5oqK5bP6+ISpkPH9OFFy/d8Z1QfXjR9ZmGqHMTwUiJdzEkusDGK1BPodzMWcSgydzQXuD7NuhHtA+rI/djO+3x2G0wRncJMIPbV9FLgixiUxzyNOp+lKw=
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id lj8-20020a170907188800b00a3d22f53210sm1457661ejc.188.2024.02.14.13.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 13:13:59 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RFC v3 0/4] spmi: pmic-arb: Add support for multiple buses
Date: Wed, 14 Feb 2024 23:13:45 +0200
Message-Id: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAktzWUC/43NTQrCMBAF4KuUrB3JT22sK0HwAG7FRdKmbaBtQ
 pIGpfTuhqx0I24G3jzmmxV55bTy6FSsyKmovTZzCmxXoGYQc69AtykjimmJKebg7aRhWsaQpvB
 BOfCLtcYFODIqOC4l57VE6d461elntu/odr2gR1oO2gfjXvlfJLn6g44EMDTqwDuGScO79jzqW
 TizN67PbKQfFGG/KAoEJJMEU0arGldf1LZtb3sfhL0TAQAA
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=IACw7KMcWVisJNVv/9M8BMcs6sAOl9OEQL2J1N0ez8g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlzS0KmRl9SRbfymQtKRJt3TaVzG4PtPDrk12mx
 VVLVrxaDHOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc0tCgAKCRAbX0TJAJUV
 VvwcD/9/eewiKANIY++vvCSQKHTeAsK6/BWHgZLOBtXv8It3S7cuwCVdZGI1pwgA8zdY8UtzKrX
 XXfvQ16NYKhgW5cGqHhX9YHYqK0jla3EHwYP5p1FPkJhK3M8ERewnaY4FzPqM1Ua3Kselb5fSpK
 ttpEuOObuF2SyXJUVO9lvlyeRc/QxszK2f8so6evN7j8nVi9EDW3Kl0oN3IjR+3u//X2P2VIXQD
 zhmLll2dLLdafN+loISJ6z4fTxz5ML3EBY7IVcPJwdd7WCHZfOPv8cDZEhsUNuOqJveYoXg16Mz
 noTnRYPzmbtmETUw3pDt0sMnZsTVEHCLncgVYtLChRdzO0rLS8/OSMFrwkvTjgL7AtB9NuXsqCA
 uplStRuKZjSVNwwKh1S67bAqKcBN5V+aBG3R25vaMIgsKCmWl2Rq4qcjrhm9KS83KQs7x1U3wOm
 XyT6n0DvlDvSdASyqOVPd8ru8oJWO4pgosQ3ZONxntUOs3IjCLUy2TUKP5k63jvQsYi+/flLsBu
 t95kdXqc1szgbY7Fs+wuX59e8bkUZtazkl6GIDVD4X4CADQtwwckeT3oiuehhY40SuJbWGVpGiu
 X9+YWYt4MJhLXOyT9HSGPIoq8lT8iuwwK1NZf+zpUpths6g1K9wAz1fU91LkewQ8IXQy+CfPf/h
 ecAzlXpyrMI625w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_131402_741687_1E6AC14A 
X-CRM114-Status: UNSURE (   9.52  )
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

This RFC prepares for and adds support for 2 buses, which is supported
in HW starting with version 7. Until now, none of the currently
supported platforms in upstream have used the second bus. The X1E80100
platform, on the other hand, needs the second bus for the USB2.0 to work
as there are 3 SMB2360 PMICs which provide eUSB2 repeaters and they are
all found on the second bus.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
- Split the change into 3 separate patches. First 2 patches are moving
  apid init and core resources into version specific ops. Third one is
  adding the support for 2 buses and dedicated compatible.
- Added separate bindings patch
- Link to v2: https://lore.kernel.org/r/20240213-spmi-multi-master-support-v2-1-b3b102326906@linaro.org

Changes in v2:
- Reworked it so that it registers a spmi controller for each bus
  rather than relying on the generic framework to pass on the bus
  (master) id.
- Link to v1: https://lore.kernel.org/r/20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org

---
Abel Vesa (4):
      dt-bindings: spmi: Add PMIC ARB v7 schema
      spmi: pmic-arb: Make the APID init a version operation
      spmi: pmic-arb: Make core resources acquiring a version operation
      spmi: pmic-arb: Add multi bus support

 .../bindings/spmi/qcom,spmi-pmic-arb-v7.yaml       | 119 +++
 drivers/spmi/spmi-pmic-arb.c                       | 956 +++++++++++++--------
 2 files changed, 712 insertions(+), 363 deletions(-)
---
base-commit: 2c3b09aac00d7835023bbc4473ee06696be64fa8
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


