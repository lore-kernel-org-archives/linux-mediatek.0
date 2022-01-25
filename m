Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57606C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 09:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kyP/txE1Zud6+dbSFFn5e+o/bwa58n5suEZ4KHyWom8=; b=nUR1cPw1xXWEYe
	W4/q/7swWH8UcE3q7nEPuoIrlWnuHktDytRRkYihQehdMxH1zliD5tCl3FOicvcDa+r1ifJoRHj7u
	XOuTBTStxrlGMkXRIE62IC2/M7VVMwSxRXtZD/U+g2ZWPIwgpkTVmLDY+C/S0ef2i3op8e4plJqRP
	FYcVqAJuO1nu5ch5/IfD2DfF1kP7XlYJstLYURy3JUzx4qBvKQBD+b/kGpbqL2ZxPqiSeJl+D7teN
	nRbiDM+nrpzdoCwT4VlLtAmN5VOwjpvBjuAbypE2VSikPQA4VcPsE6GqGBde/cxmpvoOP9bujPRrD
	KgtvaGH/QmcMgwGeeA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCIOp-007FtB-Kv; Tue, 25 Jan 2022 09:46:03 +0000
Received: from mail.belongsenergy.pl ([185.45.112.191])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCHvP-0073XU-2q
 for linux-mediatek@lists.infradead.org; Tue, 25 Jan 2022 09:15:40 +0000
Received: by mail.belongsenergy.pl (Postfix, from userid 1001)
 id C89DE266E2; Tue, 25 Jan 2022 09:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=belongsenergy.pl;
 s=mail; t=1643102137;
 bh=JAEkA4FCBmQ7T7M+WVau75EdqeDf4MEEr9hE2/l61BA=;
 h=Date:From:To:Subject:From;
 b=DtAQ8JqnpoUKV/1ot/7H9iEwiX2tDYmJyAQRz7CBgacL8LiORfZWuR8E8Kgj513Ek
 iFCG85PgZUJywmDPvuLErg5nNiR3LUycV1ApcJq6r2OA+Y7fM6kOjxya3Duf9BYqzd
 7YeKvsH+A7//BxcJuym+E1W995S0D7BnHJNTAFYrLCklPLy6X+assM5GM+7S2SvM6W
 Zl2xet5wQ5mCEJKc/gRrBDL1KdM8qW5lFa1d2p+bOoweVYM2vCqKeWTJbjJLjZnzoJ
 BV+S9NFbSruDbhCal5GB/vmxLaX+jV4qxVGv7glwZb14hYFzdR9a3JT8itwOO9PhXC
 6uK9MVRt2Dh9A==
Received: by mail.belongsenergy.pl for <linux-mediatek@lists.infradead.org>;
 Tue, 25 Jan 2022 09:15:27 GMT
Message-ID: <20220125074500-0.1.7.2w8.0.b1wkyfac1z@belongsenergy.pl>
Date: Tue, 25 Jan 2022 09:15:27 GMT
From: "Maciej Nitycz" <maciej.nitycz@belongsenergy.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.belongsenergy.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_011539_298199_364C765A 
X-CRM114-Status: UNSURE (   1.72  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCk1hY2llaiBOaXR5
Y3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
