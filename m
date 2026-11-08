Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66833606A332
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 18:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VSKuIB9J;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cw1BPu/j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=; b=VSKuIB9JXZd6kpCZpOGmfuuvSt
	rSp3GCne/x0kPp4tKceDcJFtffmNrrNbaFHBEI6KD9HeJORhXj9tOBee9PKrWR/gR/To8dKcGnkYF
	VBEjdnEnYMnqHvna9M4ZAlPtA5j6D04D5Cst7dikIxS6m8gx8Vxnhc03s8hFCrhKR1ineD63+l6E/
	IkL68AbskonJdia6vK7Wh7OS6NTUN5U25jQ9cJFjPH8l85G89+kNwkGTsDHX6CmZnvSl2b//irXIE
	ohBu+cMgKK83yQabSlLMb/uCHH4LwXJo2NtHi1KhSsbxWgw4OxkmTyFstCnYjwVE1E1b2LgFZDtH8
	SgyzT7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ7cr-0000000GUHe-3TWE;
	Sun, 08 Nov 2026 18:28:21 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ7co-0000000GUFp-3tJL
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 18:28:20 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b5669a5100so281963a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Nov 2026 10:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162497; x=1794767297; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=;
        b=Cw1BPu/jufrdf+FHWz8bIFratCmBo/HWBRpho5epOoxrE1Oad3Y9EbIGr6quaRSANO
         SdNvlFK8aSbljl4TXxHGCSRw7FarWgkdKPvb7YTHkA5r6/h1Mg9t3ividvwIgdnJxg+J
         jZLhqYAAA5QoRip0OBdm5uHAXjP6GDKckZP9LdlEOJyV17gp8q/WlimDY/iYMA2OCUR3
         IOUeAiqcofoggfGZGmgO4q2t6FPSRn35o9c/ve6Qj7+G27iZaWtGpaqKdmE20eSoCYRx
         jkhOq4Tx0DcBcgy5/4anSF+iv0gJwFHrpDVYHk21vkNyW9N7aHQ8QYsd6Qyl5sBSvk8j
         AZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162497; x=1794767297;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=;
        b=pmz64j2n4j8myPpAC6jO9L5shwc5cnZeRfnG224A9E18tB6bGTuLwurof2g94RWbAD
         my8sebM8LV1c7oCtsXp0ApTq/2XCgSG9o7oznqwtLWw9CZ7/Y1oMhbWoUrQBHN3uuNHy
         GcUUZNc1L4o4ko61aiPeHs+w5uPHNsQAYPKjXa2Bb+siFIg5OF1EBGYV2YYt30KDsXqK
         PctQoq5JDwjQJZCLviKR2sMIGJClYQIJK6kriC0q3bAcKGDcfD9S+z2+oHO/3ODPvU8Q
         0lO4h0M7xJ0aK4Bv0UWG6MlGwQhnCfTbYlaBnUPapJ8p9ubpXRavUJXBh9CSC/tCwZ5t
         u3kA==
X-Forwarded-Encrypted: i=1; AL+hErFz0BqOxDHpDW4k7iT8cgaltzWC+zF7sO/WNnTD2+0FKIZ9txNII6zvqed6lIcgzX00BPOmSPFhOnIZP9Wn8g==@lists.infradead.org
X-Gm-Message-State: APuU4Z+5LGj043hvmMfJGwJ3nnK+b7kRcnIcf9DMf27EYp5sN22v7ebx
	lRCZE4bYi9jpTyQlSZDL34WanmQKlbjCqMcj56zbJKEPXJ7To5vySMbc
X-Gm-Gg: AYBFou34jQnARHuFOaJrNDa4nlfoIjYNVrbfI8ZxZmhzH3nNCzpQDlpoDJvrlznZMYp
	Q+a02i/pWwDVIO20lt1Sx47y7xfzJOoVhMYv+/rqpxkzZlXoT+DayZSh4zGHFzqxLA3P2k8U4O7
	pQuxMdYhgtyD4fryYOcDNMW9x4gczpmMpKVk+bYiSil2AJ7XHCZ6EHRxMPj5Sho7w8PDKC8C2IW
	A9jewgk7BAQT5Wtwt6Ob3XKguIg9rNHAFfQws+0ERIc82yWWh7GINuYUYcFag6g2gSDB9kUU9D9
	n3lFtRnNAAxxketJhT3DtR3ULFIiCr7NPDiIgYYCouxiaPQFYoPPXW090NU3X4rOeOsnW7nzy28
	nIyvg90TTV8O1U7wzZUVsYurisJKBn+VgXJBDuIXbOJMIM+VUgM1tmLDdndS83r09lxFQEaUoEm
	oQYsPovBBGibmPRzN9Hk7gqE/1qIqndth6yjN/I12/Q5PJi/agyDRfmFe+6OjURAqlX8OUJQ631
	NBBsJi471RqAe0fdCFbteJj3NlWgd3VoS17IDkFdGEFGHq0kji6OozENC3awSklzWcxUCA5iqSW
	GcVRCCl13GHv/8n6HbKY1U5CFtHeufwHyv/LZ1C2aM7nSUPFCnFRSGa8IqeL+mhN
X-Received: by 2002:a17:906:9f90:b0:c3e:e726:9548 with SMTP id a640c23a62f3a-c4d6d35bdb4mr141902266b.14.1794162496378;
        Sun, 08 Nov 2026 10:28:16 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a47515dsm75254366b.44.2026.11.08.10.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:28:15 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH 0/2] pinctrl: mediatek: Add MT6895 support
Date: Sun, 08 Nov 2026 21:27:09 +0300
Message-Id: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWUsCE6XoVYwLpUM7RtEANk2Md
 y/V5Vv8f0CkwBShLQ4I9OHIq89QZQH2PfgXCX5mA0rUSkkjNvY2hVksSZumFqYyiCgfrhos5Gg
 L5Ph7Dbv+dtzHiWz6X+A8fw6MQLJyAAAA
X-Change-ID: 20261108-pinctrl-mt6895-84822207f4ac
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_102818_982918_6D90AE4D 
X-CRM114-Status: GOOD (  11.08  )
X-Spam-Score: -1.9 (-)
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

The pinmux macro header and the pio node will be sent with the next
version of the MT6895 / Xiaomi Poco X4 GT initial support series.

The tables come from the MediaTek driver in the Xiaomi kernel source
release [1]. They were checked field by field against that driver and
against register dumps from the device running the vendor kernel.

Tested on a Xiaomi Poco X4 GT (xaga) on top of next-20261102: pinmux,
pin configuration, GPIO and EINT.

[1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/56ec519f6
    (branch xaga-s-oss)

Assisted-by: Claude:claude-opus-5-5
---
Alexander Letuchiy (2):
      dt-bindings: pinctrl: mediatek: Document MT6895 pin controller
      pinctrl: mediatek: Add support for MT6895 pinctrl

 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  |  228 ++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6895.c          | 1617 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h      | 2717 ++++++++++++++++++++
 5 files changed, 4573 insertions(+)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261108-pinctrl-mt6895-84822207f4ac

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>


