Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627B6EB363C
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2026 22:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z0wG9Mhmgg9tD+OBPSDpFLVc2LfdmVCQi7222Nz/pSI=; b=49eNGPLpUZRXkvoSYtZqb8MzmX
	tN6X4Vabkg2z7p87dnCY9AJ/RHuhbHpdO3HVbMQ4q1RW0LNaGl77OHVuVSdU7n8REL213ryWdZnZJ
	29spWDt012ewDL0WmM2Q54lVk844mhchKhYs6IE/xPUhx5/UhPc8RJPIXvdKye92PsrR3wlSeViyO
	SjRuXfPUfWJZ4iJd9NeiohLA5Ms6+PMQebCKmZYqoGYTH2+l32/9v4bWGaDEaNwBMTkpURtRSuW6H
	IMPFeKTUA5Tbfqn0s5j3+BuVLeEMs79HXXNBCUws8YHaqwEEbgX14rlxxK2qT0WeoNXJ8wAoof7P7
	dRstVqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxC3m-0000000E9Gj-2b2T;
	Mon, 02 Mar 2026 22:48:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxC3l-0000000E9Gc-2tnY
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Mar 2026 22:48:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54508600AE;
	Mon,  2 Mar 2026 22:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2F2C19423;
	Mon,  2 Mar 2026 22:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772491696;
	bh=I5LiEPYHyfYN2sGvuXOiWyPgDHM6sRAC8/Jw2yALC6I=;
	h=Date:From:To:Cc:Subject:From;
	b=ShcZ60Gp95EoSk1Xca5kitC4jfnr0AF0HIKyURkWz8DjerQR5aEyPLHcgj4+S1HN+
	 aVZsYFFi+yYhf4WhVdi6ROytvdsj/6ZL2NjGK90HTtcZ85OX8SmJDjn6HLjac9VrMe
	 n7zFrDkY9FFvnOPre9tFQIw/kEHyk2IpJjaKecoOlh0WSIiDxn64CpAjdMdCY9rl5c
	 1+kaxd86GaxxD9uxpNqBR/hlsTmC/rXy8M/6hjTXfA4zPoaUO/+qViZKkVYAhn5gpr
	 hD8Tqjx6zqGr75seA7w5UVS0sSY+ZwNBlWXovCtE1L0GBsPwqpGIX8otpolaYCA2Sz
	 k87E+h9M4wXXQ==
Date: Mon, 2 Mar 2026 16:48:14 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org
Subject: W=1 pcie-mediatek.c snprintf warnings
Message-ID: <20260302224814.GA4029890@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Just noticed the following errors in W=1 builds.  I doubt there's any
real way to actually overflow the buffer given constraints in the
code, but these are the only warnings in drivers/pci/, so I'd like to
get them fixed so W=1 is more useful:

  $ make W=1 drivers/pci/controller/pcie-mediatek.o
    CALL    scripts/checksyscalls.sh
    DESCEND objtool
    INSTALL libsubcmd_headers
    CC      drivers/pci/controller/pcie-mediatek.o
  drivers/pci/controller/pcie-mediatek.c: In function ‘mtk_pcie_parse_port’:
  drivers/pci/controller/pcie-mediatek.c:963:43: error: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Werror=format-truncation=]
    963 |         snprintf(name, sizeof(name), "port%d", slot);
	|                                           ^~
  drivers/pci/controller/pcie-mediatek.c:963:38: note: directive argument in the range [0, 2147483647]
    963 |         snprintf(name, sizeof(name), "port%d", slot);
	|                                      ^~~~~~~~
  drivers/pci/controller/pcie-mediatek.c:963:9: note: ‘snprintf’ output between 6 and 15 bytes into a destination of size 10
    963 |         snprintf(name, sizeof(name), "port%d", slot);
	|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

