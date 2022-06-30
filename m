Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B328C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 15:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:To:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QPgfmGPzo0HoQgLvHwpuXu2y4ENd3LIeeJow1FQOZaw=; b=GKh7ktcdTj526rDTu7G96JtZrM
	ce3LYyG8nktwFQgWe8AcY05qZe9wiE4pqk9wD/lTn218Od9/ceZPfufuVmpewK/szF7XZ6LwTeSez
	dTugmYCah3DDdlU8nfDtK9mR7DKx7SmKdJRqEcH7w6iH6cVU8JiPwFK90/4ycsfGuT98hNdohUjHz
	aXFz9CmpOgtXQtxqXh87zG/tvxnmo8OtFUdTot/b5hfX93pw7YYDLtaz0Qo+6e63FmWJS5zhf/KCp
	JaAZVPR8WdQdxXiTxeYrDe/L6Ok8zvxjRK8N4kQAQI/7WJd/gTRiDA4Sl/OSX47Q8KWedtUKJ20sz
	+RazJAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6w8K-000HtA-3Y; Thu, 30 Jun 2022 15:31:08 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6w8I-000HsH-8S
	for linux-mediatek@lists.infradead.org; Thu, 30 Jun 2022 15:31:07 +0000
Received: by mail-wr1-x431.google.com with SMTP id d17so22215571wrc.10
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jun 2022 08:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=QPgfmGPzo0HoQgLvHwpuXu2y4ENd3LIeeJow1FQOZaw=;
        b=AVXmm+ZXfrskSt3CnXkgE32icW5o6dB1+Kr9qoI6WVf/HO8Wt8SH+hWsdhzmatAs9g
         jKqXElYHSsvSDQLilQBFUxTF84NIN/7LyXwXmovwJ4AnMcBPGc8cErL1zGoh7UHI1tIV
         VA/Dm1GuNzMXrEaBJ3VsDOSY+PwZ2ebqSaO3FNQfH1hMUOhFIS36QF8fJKY5nPDKzmBc
         6HKhmM2ZJZXG+4yQJo9KjbCahupnYJag1z0wY31iEc9RVKgMfcEzeBR4TppbWhwwVSaK
         9rXdPBoH53/uBjHF1gbz8yuiZdsiGS5xOj5p4ScuEe/Wrl/IN4shpsqHjGRxmvl6qk+Z
         ekTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=QPgfmGPzo0HoQgLvHwpuXu2y4ENd3LIeeJow1FQOZaw=;
        b=Xxlyxiitbr+SER0Q6PE7FYhUyoyXei1eMNXvY3crCG+oI7ZgkVl5d0LhqP6fqPiHnV
         hPEHj+i0h8bcxYMkMwJOrGQtra81WRk3YuE+qHLyzG88DOikPJLD8w9JHGZ5vYwhFj8G
         VPkixqbnM5+rJhfg5b1m8O+MoD6u4ONWlWZoLbVDUAtcoik/iJDOXXriIzuK1Px8bIwG
         6iIhMta84Vi/7PBnKwKLolHIPfZA1AnsRnwv8OlNDoBbLUcQWwMya2/QUpXZZ6dF6js6
         WJy7tQRYB9MrEIoxznLA5m+iZp96oUIiXu6IA5WJ78xgCPdfg6wTaO4lGnoSV8JKp+7S
         +zUA==
X-Gm-Message-State: AJIora92xFY6NfDCYf9m2Wx1zQtZ5JAdMHOssOPNSNFnuT0XXNuJxbgm
	NlnSnFrmu2avEpk3mnVZvUUoVWtQwWk=
X-Google-Smtp-Source: AGRyM1sA9RZ1YJUMhCJrhJVFfLLEpeG5MI1/vOUKW8EB8sh1ch4Zbtg776H7onLJQgPaMFElHbsl0Q==
X-Received: by 2002:a05:6000:38f:b0:21b:aded:e791 with SMTP id u15-20020a056000038f00b0021badede791mr8550902wrf.225.1656603063329;
        Thu, 30 Jun 2022 08:31:03 -0700 (PDT)
Received: from DESKTOP-L1U6HLH ([39.53.244.205])
        by smtp.gmail.com with ESMTPSA id q12-20020a5d61cc000000b0021cf31e1f7csm11860987wrv.102.2022.06.30.08.31.02
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 30 Jun 2022 08:31:02 -0700 (PDT)
Message-ID: <62bdc1b6.1c69fb81.88069.9566@mx.google.com>
Date: Thu, 30 Jun 2022 08:31:02 -0700 (PDT)
X-Google-Original-Date: 30 Jun 2022 11:31:04 -0400
MIME-Version: 1.0
From: carman.dreamlandestimation@gmail.com
To: linux-mediatek@lists.infradead.org
Subject: Estimating Services
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_083106_355872_A65D876D 
X-CRM114-Status: UNSURE (   3.12  )
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

Fa!zAn, 11:10 AM=0D=0AHi,=0D=0A=0D=0AWe provide estimation & quan=
tities takeoff services. We are providing 98-100 accuracy in our =
estimates and take-offs. Please tell us if you need any estimatin=
g services regarding your projects.=0D=0A=0D=0ASend over the plan=
s and mention the exact scope of work and shortly we will get bac=
k with a proposal on which our charges and turnaround time will b=
e mentioned=0D=0A=0D=0AYou may ask for sample estimates and take-=
offs. Thanks.=0D=0A=0D=0AKind Regards=0D=0ACarman Riley=0D=0ADrea=
mland Estimation, LLC


