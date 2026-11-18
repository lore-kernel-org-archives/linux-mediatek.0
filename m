Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDF3606A325
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 16:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MMM0gDyi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YkKcKa96
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=; b=MMM0gDyixLKRxn3xOun866Qong
	bhE3XBDIWr3qNnC72cmblijsMRkWv32E1zXRPj7InSrolTIaeF1/xqVBuXIaUk/ioDJqM6wnAcA9N
	yw0w9xVlcOdYM2wUuhTjWWMEl4w+Zl1yeu/bt2QU6xPLVoybGhLTtzsY30lcFPL81r4D7GzKSXTh7
	YYl5WaGr52Fjj3pbucUT9PDlJGt/8Iu8poFkFfACE0ECTj284eREhnTP0vRyzYndT/M8Q06ABNmr5
	3FzhFvKdKTq5HtiafI0wBfz982q/nfPmU5uxK1TPFz6O4Yw12FosQwokEr+xUcIgkWf1Dpgy0PCjx
	es1BB5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiME-00000009RDX-3ifP;
	Wed, 18 Nov 2026 16:18:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiMC-00000009RBa-27Ay
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 16:18:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-49a92144733so549864f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 08:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018677; x=1795623477; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=;
        b=YkKcKa96bH+weo+r00CKxtddjGQ2qdMC5B9cA67Rp0apGqxfbxq9IU3r5lo8PJWrvh
         8+jHZwCbZdM4+UEWz4xhVEZuRQQcaT29Ob3TSA4GrZqsrBrXJm/VcRKHGxvQnYv8qtMa
         D4c2w3PtQLbAwzvRUlAAJNeA7+KweZ4povwQ3e986XhIKYc7DFpaVkhkkDHVuW9zTsVf
         4BsAMk+4r6l+qw0O8q/FJb0vPEs/ch9T9e6RpV+y1J5X00iNGGpngBKYVCplMywPzSHc
         SEbUdcIQfA6fw9rXQu9hOrbkXIQ99yBQkN8Nqreus/YONncdV9ltYfGhRMgH543/tWBv
         CHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018677; x=1795623477;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=;
        b=BmfRPHZ6t3a07NyG3j5QK5AmU0eB2RHNxsBezfNpM3vcBSLsHUpU9OSed3Rfy56hlE
         42dS2N/UthOL0nLddHSF4gRIjjV+9Abd4RufUAiqPF/UUhT0BjZBB5QEKwY6OjEi98l5
         R3gkMgclEbqOSGIDePVBHAdjeaHOt8uXy7l/1mDbyau6bgt7HdFZx2B6EJRyOHueEfoi
         ffAIVaAL+jQmB+xDRryvOXy4ePFFmG7cQU1nlhRXMcHZt3tnlAu+1DjtCF4Uhg33yVox
         ncqaXkYOPpQILhCaxQpwTeBFz8WUQySfw25EiMHGPecuPPTUf3jy+DvupzRo710biXUp
         Ob6Q==
X-Forwarded-Encrypted: i=1; AL+hErGXnCGybAoO64ObRwreITpFjBHYX9YrvnP07MIxh1OqpJo/QG12iyDn6xdbY7GZeuc7mUtpzp0oPcHL5GBZ9Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z9I2oDN2zoBtJIyQfAgu8YQUBiXPLQX9EuSeHa7IBAYU0xatluO
	eQPG/PiS/Y5zwgpQPYHjR2RPJ8UqzXCPrHoan9YcamRWyiI41dFDFfqZ
X-Gm-Gg: AZFdTZdYnly/8HzT5wRUWkWXlmSSbJtcGVreynkwsfJn+iH6XO2y/HIU+bWXGGsjorG
	KQMeyxpmvQXakgvT1wXshKydTx+uI9u/fjbGYhyYlI6tfhHPYeQx3glZNDCwRkGDe3WYADmiAYc
	KrwhNfmY4U6WIpGH/GVT5fi8Xu9A8hy/GEWeE5BkCF9Ler49kl2nd6X0QBAbxqvr8u9hWnT61EN
	IUvzk+L01wavsL2CjYLBGfPD4a4ekkiJX25hz91WSRz1j+kOXb6To/hgtKAZAv+/zT76oysZoC5
	gBFAAivtaq3Q9xNfVTkJ+la+TEFI+f/EGiHO8iOmiY4vxl6Ex1aJp53/ds0uwD/4tfJ9NLpqVJ6
	2iQn08Q/3DgpcDDQ//bgHynCGNqVQHcCMXemRRMiPIryxBU1Uw71kae+9Jo8lC2MuRJoYGpdnn6
	pdIvMhorslM2e5fMDsu7iV5C0dxf535jJbLzpbq/jEwixTGb/e+ZrHvv5ThspPor+aV4tsxBQyu
	9lBN1XIIStIKsS69qxNXKbkHsLhQqQUJeNeCP0YwfrMcpPj/UNVdoUB0drR4UzxT0pBNleny8mh
	C0PmB4VMzgRb+3KVBkl17I0k0zF5eZ9u7ty6iWD4K7u1jdVQ7wcDQ/jqsK6wyYvHUlNpXokqvic
	FV9UWC2FX6pT6CaFL51pypWgXIIW/eetB/Q==
X-Received: by 2002:a05:6000:3104:b0:4a7:557:fcc with SMTP id ffacd0b85a97d-4a705665645mr5379933f8f.53.1795018676598;
        Wed, 18 Nov 2026 08:17:56 -0800 (PST)
Received: from [10.161.246.232] (host-164-37-100-34.net.onlyservers.com. [164.37.100.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100bf42sm5329699f8f.1.2026.11.18.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:17:56 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH v2 0/2] pinctrl: mediatek: Add MT6895 support
Date: Wed, 18 Nov 2026 19:17:35 +0300
Message-Id: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6DIBQFr2L+ujSAVKmr3qNxgRT1NwoGqGlju
 HvFrrucZN68DYLxaAI0xQberBjQ2R34qQA9KjsYgo+dgVNeMUYlWdDq6Ccyx0peL0QKyTmndS+
 Uhn20eNPj+wje2x+HV/c0OuZKNkYM0fnP8biy7P2Nr4xQ0tdUaCHKrmTqNswKp7N2M7QppS+y8
 HwtvgAAAA==
X-Change-ID: 20261108-pinctrl-mt6895-84822207f4ac
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_081800_569969_F50A9B78 
X-CRM114-Status: GOOD (  11.37  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the pin controller of the MediaTek Dimensity 8000/8100
(MT6895) SoC: the binding and a driver on top of the common Paris code.

The pinmux macro header and the pio node are part of v2
of the MT6895 / Xiaomi Poco X4 GT initial support series [1].

The tables come from the MediaTek driver in the Xiaomi kernel source
release [2]. They were checked field by field against that driver and
against register dumps from the device running the vendor kernel.

Tested on a Xiaomi Poco X4 GT (xaga) on top of next-20261117: pinmux,
pin configuration, GPIO and EINT.

[1] https://patch.msgid.link/20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com
[2] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/56ec519f6
    (branch xaga-s-oss)

Assisted-by: Claude:claude-opus-5-5

---
Changes in v2:
- pinctrl-mt6895: pad mt6895_pull_type[] with entries for the virtual
  EINT pins 227-246 to avoid an out-of-bounds read from
  mtk_pinconf_bias_get_combo() (e.g. via debugfs pinconf-pins)
  (Sashiko)
- Rebased on next-20261117
- Link to v1: https://patch.msgid.link/20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com

---
Alexander Letuchiy (2):
      dt-bindings: pinctrl: mediatek: Document MT6895 pin controller
      pinctrl: mediatek: Add support for MT6895 pinctrl

 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  |  228 ++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6895.c          | 1638 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h      | 2717 ++++++++++++++++++++
 5 files changed, 4594 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261108-pinctrl-mt6895-84822207f4ac

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>


