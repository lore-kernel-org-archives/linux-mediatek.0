Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD01C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:To:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G9r9WfOgycWJ4bI8LSx9NrrT1zkorjRsnv5Ba9gPKUI=; b=maDFTep5SFrzJeCB5EcvuhTQ+F
	Z5NAR0wlqHAinggIe8OzVSkEo4B/Ysfhy5xqa+ChDw194YipogYk2pfpQjRikj/qjHqCaaH+U3Mse
	PJqwqMfKoBQs2oYz8Or7dTD5j6xxB2TBpqsH8pozQSAiGyHv7cb58nXEg/Odhlnt8um2tNWkjSLTt
	KZbtA+tvfb6DGhiUm0SztbrhmZBp6OmwwTV+qQ1fWo4fquLS2t3Q4CnECBLyplm2tpNKqH1/9fDQ4
	IF0QOT/FbNhWrVf7h02G5bJNDNlrYadDlTaKNVuYIfmEOF2fAHWnA5mGhD4QGIrc+XbEbWbc50nKG
	HMOu53wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4OoX-00FhQi-K1; Thu, 23 Jun 2022 15:32:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4OoV-00FhPR-Vc
	for linux-mediatek@lists.infradead.org; Thu, 23 Jun 2022 15:32:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id l126-20020a1c2584000000b0039c1a10507fso1696323wml.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jun 2022 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=G9r9WfOgycWJ4bI8LSx9NrrT1zkorjRsnv5Ba9gPKUI=;
        b=OJ/WrSFAUczzDJJfMeMeUrzWecyWZy/1G7l3yIJ84hOrAaQc9yzaYHUy8/QyRTYYx8
         y81bm611DJvH7WlTcyc7rM9c05qSnBIkYHGT06NL6OnimUbLTrw7B6JbfhvcD9LKO+pz
         cwBsTpio9izbs33kCUYQ84DpkWrdB4qLm3yGXaUTKmCbI0F6cwEaClPwdzA369H799xY
         ACv4LCrzjv6OoJcesKV3n2SkYzbWuH1f6pfvvYGvJzNosgh4wtyRnJtKF8JFt0co73L+
         RuQ4MZ3xiyfFjeQyS+tGoEcFMeSZZwoMonI9jhPBg0BP8+BOre70LYqKByMmAMlvU0Nr
         PTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=G9r9WfOgycWJ4bI8LSx9NrrT1zkorjRsnv5Ba9gPKUI=;
        b=BtILMA2bkfksTFqupLl8YCeVaBrc74G1qkeGFcENNEP9HYTleFDXkQbTEKQxmJRSpm
         zv09Z8C1WDX0keklQqpljn1uyWrYzGPERXbg7r/HloAUCZvphbau2NyliPcr2rWc2quX
         m26M+CYxYPZZYfnz5zSz2Chz8IE1NFzsiFDVwCESFeR6B9Q4v8tcQWajV1Y0y8S90mnC
         3I11enSAGy2pfeZAoGQ1GqUkbXE8l19LuOtHQKBBLdDWDpTyvS9WwAkZRGtgya+z0QPf
         q8HmgPqf/YIZg+42AvwfGah7cxYDwGY1OpPU+cMZda8kAFA2o9wO/N81mvhea9A0O7z8
         fYAQ==
X-Gm-Message-State: AJIora+NOEddMgQwAkG4T18MdIQ6nnYzaq11nEXlF0zeOA3z3She8xNi
	3bEIc3uzXcWB+fPkJ0vVn47u1l6rgYM=
X-Google-Smtp-Source: AGRyM1uG41+SJFxIpQD9ZMcsywra1VKVOsyQNPZHifUGjXZeYZRz0im7Iqco2sUvwPZC3oG+arUf2g==
X-Received: by 2002:a05:600c:34b:b0:39d:b617:805 with SMTP id u11-20020a05600c034b00b0039db6170805mr4886630wmd.62.1655998327571;
        Thu, 23 Jun 2022 08:32:07 -0700 (PDT)
Received: from DESKTOP-DLIJ48C ([39.42.130.216])
        by smtp.gmail.com with ESMTPSA id d6-20020adfef86000000b0021b8d1b0568sm13765415wro.52.2022.06.23.08.32.06
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 23 Jun 2022 08:32:06 -0700 (PDT)
Message-ID: <62b48776.1c69fb81.7d536.b29d@mx.google.com>
Date: Thu, 23 Jun 2022 08:32:06 -0700 (PDT)
X-Google-Original-Date: 23 Jun 2022 11:32:08 -0400
MIME-Version: 1.0
From: schreiber.crosslandestimation@gmail.com
To: linux-mediatek@lists.infradead.org
Subject: Quote To Bid
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_083212_050315_EB3B9810 
X-CRM114-Status: UNSURE (   2.18  )
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

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0ASchreiber Lane=0D=0ACrossland Estimating, INC=20


