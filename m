Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0A0ECE57E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xIf1wAbIzj4CuxkxfofvazjN5/qDj/bgJx/cWPTX0TU=; b=DOxDAMEc4s2lpi
	IG8Ov/mCtbNCmfGnM84yvsCm9QUI7l/YSgt/N5q1JOB2MJa+b78lAsmKtPuElkdZsOstvU9S2tHb9
	HXrVw6Mo7uHz8sIyn90vOxkT98rJBLOYv2WQVD1zyJZs5zbYtZbc/TN22X4yAl++tJoO6L0ryU+Bl
	RJIhpsF+PFSSL2DaykMKD+RPN5FlMTlefcxGaFEv973FxKqY+2Rq3LsD81AmikV5y8kxuqfMVDokJ
	Uws5WJuNreSwToMRtNKHfWW8AuWBaXf+HsffkvHHP4hTPR5cWiav+Ht5FuLoM32MtqQuEt+VWnbqK
	emsn77pG6iqlXv5jHZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snepu-000000029Fh-18qv;
	Mon, 09 Sep 2024 13:53:46 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snenr-000000028W0-2d7V
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:51:41 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a8d2bd7dcd4so8395666b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889898; x=1726494698; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xIf1wAbIzj4CuxkxfofvazjN5/qDj/bgJx/cWPTX0TU=;
        b=kUW+KFWNHwjznTn/4Qpgf+UTdf5+1vs3vVLpfS8cQQFj9kmN+a8p6Zw6By4olPyk+y
         Wqe7wR1TZfuhg1q7PzZkcbwW8JfeCu7lzDN1go81YjuXImO4fYSbBPN3disH8nncDfUn
         Q8Fc7onaNkDKNswYTeTtw8J0erH/79tRrMtlpdiWaSQAEHGUEXHD2jyGnhv8N/Meskd3
         H8smNhjTUaxHounS9JRHbQqY1krtsSN7mufX/3oF6nKSaMyQfu7rWy02CleFxmvzGUU6
         jIU3+JD9qR3o2T3YOnQBqYXW+6XeHBdAj8q4WWzq327afcjMrF/Iw+BRvcnV2NkWr8qX
         m3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889898; x=1726494698;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIf1wAbIzj4CuxkxfofvazjN5/qDj/bgJx/cWPTX0TU=;
        b=ceQocc/BOicyxcSJhSTV1tMzdxkMryoxunwpddnpWl6s2UixhkW/2N7m6+Nwuexa9D
         BTgxirzlN6onmcdcCE0no8fnOIMciBnEUIXKcjxEQYj7a30zR+FRyROOGSNBXjG4PU4B
         bXJ3DoIIlAo84WzjeQIkmyp8eFukXXnw56cpTUoEuYmrDQxRXkj5dkuxjInQkj6bjXtZ
         lNYgfzsEm8eYp/i5Ivs4lIM9CNRLR0ja6NbDP3fUPcSQi+/EfhoY/1kUh1rWNsAuLWpq
         i1eVdKsCqfBoG/9AOQdKFHiOrQlFq8apDiKQpA5duEzBhZ1BMUuxa92RRs/+3tvrPojf
         UJsA==
X-Forwarded-Encrypted: i=1; AJvYcCUz3n5YSaZ2gU9ivaR56roc6vLtpx7mvXtV3uesUQQZu432SLXuG5PM3AZ7ScOu7pOio1Ti2w/3jmRDBMdNIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyddn/NAd0iIjL0Hs41yQWIuA2YzcxR1ssno5zBZFrnzT3sjzUp
	qggIPEsHWeKC8rTQRkvNRSq/XMbAPAYHrt2LgC6oeJsKCjcunz0DKKa6GDSTOlw=
X-Google-Smtp-Source: AGHT+IF9Mh+MgE0b3Jf7kgDpkQxsvludlLfJmIJC1bDwVRLgk1OMrtfUfpR0kKiqTATr3BREdjGX6A==
X-Received: by 2002:a17:906:c148:b0:a86:a4cf:a197 with SMTP id a640c23a62f3a-a8a887fcbe0mr296077966b.5.1725889897492;
        Mon, 09 Sep 2024 06:51:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/17] regulator: Few constifications of static data
Date: Mon, 09 Sep 2024 15:51:11 +0200
Message-Id: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE/93mYC/x3MMQqAMAxA0atIZgOxVESvIg5aowaklVRFkN7d4
 viG/1+IrMIRuuIF5VuiBJ9RlQW4bfQro8zZYMhYaqlF5fXaxzMouuDjiVNDszPG1jQR5OpQXuT
 5j/2Q0gf6uJlQYQAAAA==
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2263;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zUHhg/UyzRf/dZcnGmfWPB4ecX+Ntlv/UdMU1qsMFhE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1VgRQNlylPub6yNjTD+zg1dZZuybYlU3O5P
 dYuhnlzbSCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79VQAKCRDBN2bmhouD
 18H6EACQOmd1uI3uaTvI5UKYLHpsmpK02EBrdx7JfUDu7mYQKIwkyaQ7/NZTXgYa3NeSubtpWqS
 CYbu3d4cN9X5LRMnP/JfMWvN5nPjCJ9yezEZ1IlOJtorpsV4QDmQzpx7jhK4TVWVOT3H2EFdHf+
 Qhsg7Ra3zq3eQbpakhFmlWTVpiCXjAQ8ewaszVTwD2mhmqP8rn8IQCPWY0GBz1/zrFdwRMUSc1N
 VDt/txtsgO+LhT06oBFGSgqoMmEc+hzbAHhKWP/lqErty136Vq+GXJqRfmFwtbIDq/W6PI9lVj9
 LrZGJI/T7x7FhrH5V2t2MvvXERnKJMd1yscboisw+JYX/L6PMT0uqXRxF2Oiok92GZXua7D3gpQ
 KG/LN6HH0YYWc+KVxGaikAADasjgiO10L9qOwEONgUsBx8z44TncZMgPRAqUuuadqj91gi448lM
 xC2+L5ablOxm7cUiGaKaPgeSaZQK7MtJPbpuBhFq7jDN3It20DFo90EF0+qwO8a+S3Y0jLfYnuX
 lLJASJvsh5c7KTi54zRhQY5H6elWKfnkvjsM6jtWVrI/DbJSF/wsoIke4n0rYXEDmg1UG+7NU7t
 WQLd1Dr6580QziSbr9Z1VjK64AdhO5rmijvUVs3Bc6dwmjGCb1No0vYDv664QDCk8T0v5mVFnt2
 wSjVdO9X45kDo+A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065139_759949_4AE8E54A 
X-CRM114-Status: UNSURE (   8.68  )
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

Hi,

Few cleanups (safer code), built tested.  Last two patches should
probably be tested.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (17):
      regulator: da9052: Constify static data
      regulator: da9055: Constify static data
      regulator: da9063: Constify static data
      regulator: da9121: Constify static data
      regulator: da9211: Constify static data
      regulator: hi6421: Constify static data
      regulator: hi6421v600: Constify static data
      regulator: tps65023: Constify static data
      regulator: max77826: Drop unused 'rdesc' in 'struct max77826_regulator_info'
      regulator: max77826: Constify static data
      regulator: mtk-dvfsrc: Constify static data
      regulator: pcap: Constify static data
      regulator: pfuze100: Constify static data
      regulator: qcom-refgen: Constify static data
      regulator: hi6421v530: Drop unused 'eco_microamp'
      regulator: hi6421v530: Use container_of and constify static data
      regulator: max77650: Use container_of and constify static data

 drivers/regulator/da9052-regulator.c      | 22 +++++++++++-----------
 drivers/regulator/da9055-regulator.c      | 28 ++++++++++++++--------------
 drivers/regulator/da9063-regulator.c      |  2 +-
 drivers/regulator/da9121-regulator.c      | 20 ++++++++++----------
 drivers/regulator/da9211-regulator.c      |  2 +-
 drivers/regulator/hi6421-regulator.c      | 14 +++++++-------
 drivers/regulator/hi6421v530-regulator.c  | 27 +++++++++++----------------
 drivers/regulator/hi6421v600-regulator.c  | 10 +++++-----
 drivers/regulator/max77650-regulator.c    | 31 ++++++++++++++-----------------
 drivers/regulator/max77826-regulator.c    |  4 +---
 drivers/regulator/mtk-dvfsrc-regulator.c  | 10 +++++-----
 drivers/regulator/pcap-regulator.c        | 12 ++++++------
 drivers/regulator/pfuze100-regulator.c    | 10 +++++-----
 drivers/regulator/qcom-refgen-regulator.c |  4 ++--
 drivers/regulator/tps65023-regulator.c    |  6 +++---
 15 files changed, 96 insertions(+), 106 deletions(-)
---
base-commit: fd9058d56c6de25c2d3215db4e2e950a7965ffd2
change-id: 20240909-regulator-const-b70dc22450b0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


