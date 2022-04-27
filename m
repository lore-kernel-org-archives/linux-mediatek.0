Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0271AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 13:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cITB6kny3u+dPn1o0LDAghPO/ju3QBkGqCraxvyzS4U=; b=exqDlAb7vL9rza
	JOVIdBNTWPalGcszjLRJ2Su+Oi3TUE7B/5UkjaVbKTMwfGzsrgWyA3ytpTlkQ5kiV0ov0W23BmGE0
	j2W8fpv+uOa4bq66SyCKCKGfQ7c+HjYf6/1uoqy1iZp9T6v3tIwG1+v41n91yyuPPlkYdycNcFElM
	7kTIb37GaActQ10B72Z3/1lnHWQe1/WosldZqRN3g1lDAOh/Ia1nSMXPXyVf7LJVU+CTLDaetkhAK
	Qiu8R0VjCAhScveNs35YuCoMI3SLdCXXfysjmx1pWtiZ3Yn6dQTQSywMzQEQHU+S336larv18wRE2
	iyI49cGqYoeM1eANBTww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njheQ-001WhZ-Ui; Wed, 27 Apr 2022 13:24:14 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njhe6-001WWI-27; Wed, 27 Apr 2022 13:23:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7CFA81F4470F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651065815;
 bh=EqjX82GXjqOFhq0gUXw4CciC7Vh5NdYSqj0fE42uX6o=;
 h=From:To:Cc:Subject:Date:From;
 b=bSxZLmiNzzvmXvS/G0LxIU/onl0isc+fFq4malUf2KNMqo23k4kNwVDTtuflJ/w4J
 HarckUhk1BL8we8qLtMgp3haKnf/itziBU9PrNASD+/GJXpm6aLc3D57RJhXzb9Riy
 l37/ujoD9a9pdwCCC0APr4XvDovBW8AS2b5t4H+Fxv7sEZou6YXG+oX7qPTrAMKnA4
 3aWqVdivsu4IRy/5xbiGPti8eMVdRII8HAUoCjwfOWrVCQV4keFlrXQBnxJcEObmne
 Xft18vwjFIOwH3yjSNJ8DUvD1zgCney2xR9Msf+rhkaBmnlRcciKHFsLVAtaackZHb
 VJryDVrVaoGxg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, zhiyong.tao@mediatek.com,
 colin.king@intel.com, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] MediaTek 8250 UART: fixes and improvements
Date: Wed, 27 Apr 2022 15:23:25 +0200
Message-Id: <20220427132328.228297-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_062354_256052_4CF1BE9B 
X-CRM114-Status: UNSURE (   7.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Even though the UART IP on MTK platforms is 16550A compatible, some
registers are not at a "standard" offset. In order to allow full
functionality of the flow control features and to make Linux able
to fully and properly reconfigure the UART IP, eventually allowing
communication at high speed after a full IP reset, some register
offset fixes have been done.
While at it, even though this bit is always set, also paranoidly
make sure that the "new register map" feature is enabled, as that's
done with just one writel() at probe time, introducing no overhead.

This has been tested on multiple Chromebooks featuring different
SoCs, and a MT6795 Xperia M5 smartphone.

AngeloGioacchino Del Regno (3):
  serial: 8250_mtk: Fix UART_EFR register address
  serial: 8250_mtk: Make sure to select the right FEATURE_SEL
  serial: 8250_mtk: Fix register address for XON/XOFF character

 drivers/tty/serial/8250/8250_mtk.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
