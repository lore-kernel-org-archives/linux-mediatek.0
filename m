Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A824CDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 13:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/WIYTERMpa/hQ3nYRT3WjhR5KvI3DYiqFx8C9H6a/AQ=; b=PC2Fm+qy4VcFPacmRnAU9EdcBI
	DNXkOQjqoesLU8ySIaQRn5f9qBiB3UDUYKsnOtn8tsnZ4uzi+5g1/o6Whr4zGEIlX4/iHKqtuQ6lp
	/1wopyZtzRbATNffw9tNhmjrzB90JO7h8TjkuG5+L8ZmpJyFk3u32GXpI+3srXEBw9V3Oe2MdAaM3
	LZeb04mvVY5+2jnspvP1kD1gesZlU2Zr7kr1n34/euZRLLBlyEEkn1uUYa43Ff3WvoZs9uoRJSAsM
	m26MMlfNGxv/Rax0V1I0LbDA19mzde+WVb3xQcgOBbPYsTIidIVQ5mnD25IxnA86+qr08j1OTSXdc
	lo/fI9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6Jz-00EkNG-0E;
	Wed, 18 Oct 2023 13:10:47 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6Ju-00EkLN-2s;
	Wed, 18 Oct 2023 13:10:44 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c5071165d5so7784331fa.0;
        Wed, 18 Oct 2023 06:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697634641; x=1698239441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/WIYTERMpa/hQ3nYRT3WjhR5KvI3DYiqFx8C9H6a/AQ=;
        b=nAPLq+y9ox0BDqN6H9E3fd1ajU9v3ucR4Q+MQe1aySQ+orgGqujC8jQYwBZJS43A9S
         eD6mDS4KWAHn2NNcKelEqe01PBnz9wSYhxUVlQztMECmpUlUqN1JePoY6qyQCphSXAyr
         U7lYOVJDvqqQwfi9cM15LrRLSjfY6rrOPp/eEYEGTCUSfIhTqFnqX1arbNW0yWlIe81f
         eZMJUpNWQFMI3SL7etKmVC6kC4JFBnKFWdBzjoIYte5AHs2/552DGI43UoL9ehmsavJG
         qx5+HXApQeXoVXHXX/L+gQt8iMIq107HWuusU+8VRCy86R/tIiEz5521jlHo9nHSvfQ4
         THCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697634641; x=1698239441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WIYTERMpa/hQ3nYRT3WjhR5KvI3DYiqFx8C9H6a/AQ=;
        b=n8CedQll4ilqLl6GWoGI2phny3jl6PW3KFhffInQDG/sLWbU8C19RutAZF9e3hwcN7
         HEGzgArg7H4CWgfZcLW33x+xriftNNWMKzf3eA89HGdjRj+ooerikSDDUo35eYgL50pa
         KhVOFJcHG6DdpjP856NtYpwX+ETCSzkYLFiPL7EtH8zPKrnDOO/BY4xVVfn5y0viphJa
         M+9VHluEqF80RGMS1QT4K3Jnm6ZKSKDHqptzO1cL7v7il1/3qyNmdtJqyHClRppYj9gn
         Ple1k1G2wwXCKfLKqVvWmG1ag8ccewU/6ncsoROlcvymcUMxixPgtr4me8uyFxLD+k/2
         ajCg==
X-Gm-Message-State: AOJu0YwTKUc7vq1jBszXRIleuWVKcKuLDgVbkRaKnW/1BeBN2bSez7jF
	EC1hipyjmIK3/BoZ9gF8S5w=
X-Google-Smtp-Source: AGHT+IGfdJUpk8Rdt2SKdTJZt1PuOoBqvCcCill/y7BxjK6YaWEs7dFTajSyDUWp2IXypz6opVTCQA==
X-Received: by 2002:a2e:9c43:0:b0:2c5:234b:d1eb with SMTP id t3-20020a2e9c43000000b002c5234bd1ebmr3001799ljj.50.1697634640737;
        Wed, 18 Oct 2023 06:10:40 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u6-20020a05600c138600b004064288597bsm1677426wmf.30.2023.10.18.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 06:10:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 1/6] wifi: mt76: fix broken precal loading from MTD for mt7915
Date: Wed, 18 Oct 2023 15:09:37 +0200
Message-Id: <20231018130942.31187-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_061042_926441_6635E9B0 
X-CRM114-Status: GOOD (  15.24  )
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

Commit 495184ac91bb ("mt76: mt7915: add support for applying
pre-calibration data") was fundamentally broken and never worked.

The idea (before NVMEM support) was to expand the MTD function and pass
an additional offset. For normal EEPROM load the offset would always be
0. For the purpose of precal loading, an offset was passed that was
internally the size of EEPROM, since precal data is right after the
EEPROM.

Problem is that the offset value passed is never handled and is actually
overwrite by

	offset = be32_to_cpup(list);
	ret = mtd_read(mtd, offset, len, &retlen, eep);

resulting in the passed offset value always ingnored. (and even passing
garbage data as precal as the start of the EEPROM is getting read)

Fix this by adding to the current offset value, the offset from DT to
correctly read the piece of data at the requested location.

Cc: stable@vger.kernel.org
Fixes: 495184ac91bb ("mt76: mt7915: add support for applying pre-calibration data")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 36564930aef1..2558788f7ffb 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -67,7 +67,7 @@ static int mt76_get_of_epprom_from_mtd(struct mt76_dev *dev, void *eep, int offs
 		goto out_put_node;
 	}
 
-	offset = be32_to_cpup(list);
+	offset += be32_to_cpup(list);
 	ret = mtd_read(mtd, offset, len, &retlen, eep);
 	put_mtd_device(mtd);
 	if (mtd_is_bitflip(ret))
-- 
2.40.1


