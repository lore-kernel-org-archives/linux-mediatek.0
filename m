Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17709C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Aug 2024 18:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvbZ+8SyXPbkfWIxq8fFFxIwmoC4vttG1Fog7o3RX+I=; b=4C9pVdbpC3YseVxe6eEIStkZ4A
	i85eeYqelLeoxGuFjzm/aP6ymuWLqje41ngSZtx1eT+R3FESTld4andy35D5BHTppikhW46q0Zs8E
	5zdyX3VUGrAPz28D1Zi4kQbDIxHzVoUOhV20QF3h99BP4iUCOms6bQ8Vj9ziJfF7LEvpHZClBmjQs
	2j4zkbewesYP7EQhzG+O28Zbqr6auBc2Z3pdYywJxVObB9BvZ1IQvADc3fs8KazsfOyLT31uPGQkQ
	w9Cj8YAEOLpLP9vIUKYg9h4ETFVgP6RqKWROPAvsHg3gkbQbo/kBG8tHqoKYJSy0WdSXbIvmSkqwR
	vLjTIW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdDBn-0000000Fwdx-3HTQ;
	Sun, 11 Aug 2024 18:21:11 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdD8F-0000000FvUG-2our
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Aug 2024 18:17:33 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5b391c8abd7so4229072a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Aug 2024 11:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723400250; x=1724005050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvbZ+8SyXPbkfWIxq8fFFxIwmoC4vttG1Fog7o3RX+I=;
        b=OE95aN6F4Xm3ASrG0yvyg5st1EuiCuA1B4x98ybfaJp2AA9tzTIaxBFu0/LCvHFd49
         fmwifFHC7jWl2LxbsWXLH2yfR4/ai3PSNR9U+lyCMPHeHiyZngX8id/Qpgt/XJJw+99e
         6h3lBmY6X597ixhLUCB7XWawNBHb2VrGgSlzfybxe3kanH3pYdziI95wpWECx9SZ4P0F
         82OJydqj/tf7603YmPncxHObyb/IQN85DkCbKNcSv65a9yv31dSlYvhWbmncl6/MFqxj
         A+e486seZO1Ajvugce3ekD/1mUIlrRxoPdlo+CHgu645vKXqA+EhNfiCsY7UvLlxqg79
         TCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723400250; x=1724005050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvbZ+8SyXPbkfWIxq8fFFxIwmoC4vttG1Fog7o3RX+I=;
        b=jt4L38s13Wh2iYqwUsIOOyRQGQhZc7QoyEuQEHxB6Tp4IeiVn2Sb7MQGtFslBsKPAx
         hmF3GPboCopXMfKZpt2tfJHAFIeRo16+5uZeyv8sEDNgmCfPPe2t/1juFxqClgcQdZnl
         bG5U2P2iIMW7OWIKTtBtqBwB5UZE7fXitWBIg0IFVMWQQckPk79gNeU8pn6NtGkns4pj
         ASzcOReLiEboTNC0TjPGNMqC8X6+k4eRjCPntxmGs+ofTEvvRHbKX8XTft/Ws82rMJHq
         VQLWdnRqqqqMgBwhsG8nR6x1rXciDNrIgJFtku/rl7WC//3ccpoNLusvSt8XQCU32U5o
         NCXA==
X-Forwarded-Encrypted: i=1; AJvYcCW7CuFDTYZpk5YgnhiEt9ZPWI2GbCFMVkW+Jpm0Lmw30DurgskgZQMaOOxh0VAf0SgE/5wkY9WsDui/XFQTsYHph1QIB+fF7SVmxoLJiChr/4f4
X-Gm-Message-State: AOJu0YyVvxVehONsPOFnJtVf/u/reoBd6atYiJrWHD26CuoKGn6s/C3t
	vGeN4uAu/+KqkPxw9Ib/mB1hFFSWq4JGjLtxcZd0Qi4GoZDRhaRfFU6A/9WaOXs=
X-Google-Smtp-Source: AGHT+IF845o0XSP5n/BwrlmriZw7Zb6P6jQ3BpfatLkLOENLMyaMOLi7UlDJBP7b5+N/eNUzZ5p81w==
X-Received: by 2002:a05:6402:458f:b0:5a1:c40a:3a81 with SMTP id 4fb4d7f45d1cf-5bd0a6603a2mr3481173a12.35.1723400249713;
        Sun, 11 Aug 2024 11:17:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a6032c1sm1610593a12.92.2024.08.11.11.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:17:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 11 Aug 2024 20:17:09 +0200
Subject: [PATCH 6/6] ASoC: dt-bindings: serial-midi: reference
 serial-peripheral-props.yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240811-dt-bindings-serial-peripheral-props-v1-6-1dba258b7492@linaro.org>
References: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
In-Reply-To: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Daniel Kaehn <kaehndan@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=i+lTvqxiMRXFw4pW4fXIUgAA4bXjhigtS13EAIn2h9I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmuQArOhpNatW52wzJpXmws0fDjOokzOoUe8LaC
 lsqDe/iqmyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrkAKwAKCRDBN2bmhouD
 10kpD/9SOhRnOR0/feUFtJ3/1bim82Fw4+7IumOZPA7eiWKJANvWp2lMdImnWInzmSwBhyQreJX
 CcZOcbd29+X1YgRQFNNxf6PkQ444aPBNpCmUggJxXS1hYJZF6HWHMIQtlr3FelO4SHIF4QJdMEh
 exRB43qX03biWL0S+zQcNW9/WOmyfmOqJkzjrW3yohC2VGvgqpMw98+8+wpX4EIE34vvu3Hk9ta
 Dgh9Ho9WU79eqWzdn7C8aawEviq3Hbn7o7SRJX43kVaAy0KHVYOLTrWQQrVd22AVwBxm2JFtEB0
 752kvhWQRzIlOL5PEvcbg0sxnIMtixrhBPw/JZfOrnzdSJ3R5BCn1D5p1GCTPzCjBY+xJBFUDjQ
 SaTdfn+xLdc6HYz1XPQgRyypy5RTUxaqAYe9Nd5dGGgKmm1ihWw5W4W8o/C7Ko3cTAR/GJsBxOI
 PDixnjajQVDH9z6sgoDoifPyYwrLxfvWMhzWjZATVFw7x3f03Z6SIjKq/+6ScEuYaVp6qfMbKpb
 Rgo0ayBhAXShHODYAWm3U8uXrSTWMY+b1EaCNxbxB/ZSk1pmOkbcxl50h7/CfqDMq8Mrv4xMobm
 t3YbsVbWF6YCTxKpBDShzvOXWpp5ULhSQ/Y2dLnrqsQStlcfK/ZVJaPQyinHcyCcJG0LUhlfuxN
 b7/go1JyGYOp9xA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_111731_756798_107B3FD3 
X-CRM114-Status: GOOD (  11.60  )
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

Reference common serial properties schema (for children of UART
controllers) to bring common definition of "current-speed" and
"max-speed" properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This patch should probably go via Rob's Devicetree tree.  It depends on
the serial patch adding serial-peripheral-props.yaml.
---
 Documentation/devicetree/bindings/sound/serial-midi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/serial-midi.yaml b/Documentation/devicetree/bindings/sound/serial-midi.yaml
index f6a807329a5a..3b2f6dd5bffa 100644
--- a/Documentation/devicetree/bindings/sound/serial-midi.yaml
+++ b/Documentation/devicetree/bindings/sound/serial-midi.yaml
@@ -22,6 +22,9 @@ description:
   configure the clocks of the parent serial device so that a requested baud of 38.4 kBaud
   results in the standard MIDI baud rate, and set the 'current-speed' property to 38400 (default)
 
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
 properties:
   compatible:
     const: serial-midi

-- 
2.43.0


