Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA96C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 21:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Mime-Version:Message-Id:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zHqFC2vAvLBhn+dr9vFDSM6RsrMGwj0OEAPrK2Tbzq8=; b=K4aE2cOT7AUqml/IUd6B9twuj4
	UlPnb0tVU0rXwrEkob5+dkrJ7laUV819ZM+TZYy7RQ+4CTt/WLTSNQrG8vMJhnqDe+aHmrS2qiryI
	qWyUPwci0d1p9yYjACa0Ocu00//fgPwWws0auO2g+k+lqsD24m15tMCSc6fJxxDP/4a4f9ZkUZbFM
	ioQ18fsIafUXByWpo/g4mBST0ki0B8DaskC7a9yee+JC9RKN7k17F9RDgOvlyPG+ok/H6neejq7OS
	8P1sZ1E8r2U/BimZaOf2GA47vGv/pBpU261bZvyP0FQNK9pIycm7+RJP++GVkEKOo37rin17hunm8
	Q3959w7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB0yl-004vvU-9h; Mon, 11 Jul 2022 21:30:07 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB0yf-004vtU-A5
	for linux-mediatek@lists.infradead.org; Mon, 11 Jul 2022 21:30:02 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id w15-20020a25ac0f000000b0066e50e4a553so4581403ybi.16
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Jul 2022 14:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=zHqFC2vAvLBhn+dr9vFDSM6RsrMGwj0OEAPrK2Tbzq8=;
        b=VTXLdAFTNd9UwJNVkky3hIozNLYY6mYM83YMxH8oGI4oLZBAwrAybsmBIb5wT4hiOp
         bdGWsm17JWHSCJzj49qhZRobzJj/cMC/zFrpRXnXqFDoInwf3JdxlvrDAWJZGhsTJcch
         UqKYp01WFjLcw6OpeHOtG8tmI5eii8XLUf7i1ZVfdU5Igxkj37TUP1Zb1KO0bHFDD1lq
         kuGrwfn8OQJCUwzPCCJ4y4gnAwUy0gtn0C1Z+DnLJZbKF4EEoW7lnKV/30evtMD6VW1+
         IGqFHOAYi+nDRuQEH5rVGt2b/P+iT6IuRMDfxQOEtoVoLo7alxaHnaDQ39NvfAs6Nr78
         1A9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=zHqFC2vAvLBhn+dr9vFDSM6RsrMGwj0OEAPrK2Tbzq8=;
        b=BgwNteKbhjm5BbtrE9LQmqPEr9KZv1/QQt4fUZg/tT8cIaC/GKlAyPq8pqYbwNBETB
         894hF+2AFORvO88rFK8vo7qcXG9Uo+n74KlujXKJyv6fuQktvs2mJzspGyN4gmenzB1U
         ryMNcBaXc6nQ2LDGrLPOyXgGL++gpgBJMh3NPT4ulIRtQa6shhlFCQByNewapsU9CSMl
         ZzwHjgnlOGNglZWzaW4oWDOC+vu7TgwHILhjhue5LwmG01n425/oI491XekcFsvc2gE1
         5ESycVg+5K1CatacoNz1Hld/6SNvEp+96sgGuPZhg4SQRc2IZlHc9XFwUKmCID03nXmo
         xH8Q==
X-Gm-Message-State: AJIora/drcLeD/hPqYiEu3hFLst712t8GSkXFI7rc2lgTDJdMYbwfs2C
	Zk128riLc7B3X7mxzn1qzMFCMc4a6DWA9XXZ0g==
X-Google-Smtp-Source: AGRyM1t+1oh1h9sGwQmRmQGmeG2XnD9OhdrwpWmEnE6iE7hFzFQEg9WRj9cDgGkg4MOgmMnXwYe5lebG86W+m7D/eA==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:4bd0:f760:5332:9f1c])
 (user=justinstitt job=sendgmr) by 2002:a0d:df48:0:b0:31c:973f:b444 with SMTP
 id i69-20020a0ddf48000000b0031c973fb444mr21768515ywe.119.1657574997770; Mon,
 11 Jul 2022 14:29:57 -0700 (PDT)
Date: Mon, 11 Jul 2022 14:29:32 -0700
Message-Id: <20220711212932.1501592-1-justinstitt@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [PATCH] mediatek: mt7601u: fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: Jakub Kicinski <kubakici@wp.pl>, Kalle Valo <kvalo@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_143001_355017_C51DFAA2 
X-CRM114-Status: GOOD (  14.12  )
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

When building with Clang we encounter this warning:
| drivers/net/wireless/mediatek/mt7601u/debugfs.c:92:6: error: format
| specifies type 'unsigned char' but the argument has type 'int'
| [-Werror,-Wformat] dev->ee->reg.start + dev->ee->reg.num - 1);

The format specifier used is `%hhu` which describes a u8. Both
`dev->ee->reg.start` and `.num` are u8 as well. However, the expression
as a whole is promoted to an int as you cannot get smaller-than-int from
addition. Therefore, to fix the warning, use the promoted-to-type's
format specifier -- in this case `%d`.

example:
```
uint8_t a = 4, b = 7;
int size = sizeof(a + b - 1);
printf("%d\n", size);
// output: 4
```

See more:
(https://wiki.sei.cmu.edu/confluence/display/c/INT02-C.+Understand+integer+conversion+rules)
"Integer types smaller than int are promoted when an operation is
performed on them. If all values of the original type can be represented
as an int, the value of the smaller type is converted to an int;
otherwise, it is converted to an unsigned int."

Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: This patch silences the -Wformat warning for this file (which is
the goal) but in reality all instances of `%hh[dux]` should be converted
to `%[dux]` for this file and probably every file. That's a bit larger
scope than the goal of enabling -Wformat for Clang builds, though.

 drivers/net/wireless/mediatek/mt7601u/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
index 20669eacb66e..230b0e1061a7 100644
--- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
@@ -88,7 +88,7 @@ mt7601u_eeprom_param_show(struct seq_file *file, void *data)
 		   dev->ee->rssi_offset[0], dev->ee->rssi_offset[1]);
 	seq_printf(file, "Reference temp: %hhx\n", dev->ee->ref_temp);
 	seq_printf(file, "LNA gain: %hhx\n", dev->ee->lna_gain);
-	seq_printf(file, "Reg channels: %hhu-%hhu\n", dev->ee->reg.start,
+	seq_printf(file, "Reg channels: %hhu-%d\n", dev->ee->reg.start,
 		   dev->ee->reg.start + dev->ee->reg.num - 1);
 
 	seq_puts(file, "Per rate power:\n");
-- 
2.37.0.144.g8ac04bfd2-goog


