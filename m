Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C89C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 10:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iPjkftwsR9LqQ77Jtrv2Qgko283vLQTCezMdTMCIZ+s=; b=3/FR6j3t61uyetB18bZGjd6QxH
	OwWIk9kY9cqQ16GG6veKtHSUPUt/KbH/a78ujOoZtTcipkF0kNxMhqRJt41W1Gm9VSlcQ+SNOS6EY
	Zsg0MUWJWQjLtxDtTQma5WezqaLEErqQ8iUaIjdb9S4Cl+bJqCaK2zWf6Hf/QX4QnI3wcDrfv6fMP
	T8CJhVzQQmZXPVk2i4R6qlI3pgicjIzZadMhwi7vXx1mlniqFbcn/lS5LfPzzN2F2HlXIcznIPW9I
	tDT6H0ojfxk06zMoiXy4E8KvqfpFUJ8kO6eAAdR8cM1aCmKJHtNQO08/+AhaQDV8gtpwX5IQk8V1A
	nezR/RSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMJj-00GZ8f-Fu; Fri, 28 Oct 2022 10:10:23 +0000
Received: from mail.astralinux.ru ([217.74.38.119])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMFY-00GWzJ-4H; Fri, 28 Oct 2022 10:06:09 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id C5D261863FB9;
	Fri, 28 Oct 2022 13:05:49 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id MwiZZI5VNg5o; Fri, 28 Oct 2022 13:05:49 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 76F3E1863F7D;
	Fri, 28 Oct 2022 13:05:49 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NhTW9b_4Lqs3; Fri, 28 Oct 2022 13:05:49 +0300 (MSK)
Received: from rbta-msk-lt-106062.astralinux.ru (unknown [10.177.20.20])
	by mail.astralinux.ru (Postfix) with ESMTPSA id C06461863FB9;
	Fri, 28 Oct 2022 13:05:48 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Anastasia Belova <abelova@astralinux.ru>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10 0/1] vdec_vp9_if: add check for NULL for vsi->frm_bufs[vsi->new_fb_idx].buf.fb in vp9_swap_frm_bufs
Date: Fri, 28 Oct 2022 13:05:38 +0300
Message-Id: <20221028100539.30925-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_030604_398330_B3F07C20 
X-CRM114-Status: UNSURE (   3.82  )
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

Null-pointer dereference was found with static analysis tools=20
in version 5.10. Seems this file doesn't exist since 5.18.
This file was moved to=20
    /drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c.
Maybe it is necessary to create another patch for these updates.

