Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C78C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 08:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OTZcMG79Z5dYQylbpGAJUyk7N8KnSSEVIWi8E1/R3Yg=; b=qQg5oKBV+UGm9Y
	evn44dluMX/drVp4vgLIi7DrZLYK1GIlVXS5amaFxVd7SochkpenKPYcZTzl6j5BWF4zFxDAzcK6V
	6qifVmM6pBYNu9zuI+iuCjcBn9zSZPQVNyIV4VE+GDgX4u+a0As1DZykQea0XpBkTTEHNuOz9+pnZ
	re5DZi800vmSxyBeddvzyzh+MKhztYUCQQob/Ev95iDdg0OPQX+c649e0JFmDWjw7jGz5tgQD837Z
	xvqcumcAxOaYWt+MwJIKFQOs7qx8dQGIGkXOQ4Islc8Xrk3uJdKPkDmnBenhzLY8nBJrSkEq/hNPs
	R6/QWwm5yVPmY5EIf1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0JKG-00CBuZ-J7; Thu, 23 Dec 2021 08:19:48 +0000
Received: from mail.betterbiz.pl ([45.86.209.138])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0IpN-00C0Dp-Rr
 for linux-mediatek@lists.infradead.org; Thu, 23 Dec 2021 07:47:55 +0000
Received: by mail.betterbiz.pl (Postfix, from userid 1001)
 id ABE64826B7; Thu, 23 Dec 2021 02:45:58 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=betterbiz.pl; s=mail;
 t=1640245670; bh=07NAgW1e0WiNB9zqagiM2BnwZfWBCpNa2E4+ccxBPgw=;
 h=Date:From:To:Subject:From;
 b=FygU3DML6mV/bW3K7wFwUl3uy60dEeSID9aRbpFoGxpSVuhRGB+hNlglooNlyU05v
 0qlGfNY6PUedRz28JJJhk2djURnmb6eDJdyjh7csR3+MU9FcAxTS6GY7Pk4i2JG2Ff
 JMK8bJh5OQ/4gfGhzzVMGlmDMvfBGLbpbsON0pp16pA1QZtuZjijwMnKP1EhpTeSEv
 o8yYjPoHLsPN1nQ+idduQex/sE1nZZar+/A4hcfz0F39Y5Iv82Ey983qPEy0Hf+Jog
 dpLq4BK6QVxlZIdnPMVWfRHA6husKh1d5crhoq9heNlYFVvlQt+2Ns5tVTYfdwf0DV
 Uvdq0olEFOMDg==
Received: by mail.betterbiz.pl for <linux-mediatek@lists.infradead.org>;
 Thu, 23 Dec 2021 07:45:53 GMT
Message-ID: <20211223024500-0.1.f.10j5.0.vqia90elri@betterbiz.pl>
Date: Thu, 23 Dec 2021 07:45:53 GMT
From: "Jakub Daroch" <jakub.daroch@betterbiz.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.betterbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_234753_939098_B14099D8 
X-CRM114-Status: UNSURE (   0.58  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkpha3ViIERhcm9j
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
