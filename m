Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DEFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 07:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OTZcMG79Z5dYQylbpGAJUyk7N8KnSSEVIWi8E1/R3Yg=; b=kAy4MSIXISG6Q2
	qfRV+2GAwj0RxCygYhiZQN2IJ/BsdQukRwVfangNgARhgqZXmjAh3Mqa8mSwGCPFjoxGfKaNKDnAA
	VnyefHSpCf0M2Rnho4PGOJUZkL+VmU5+SHFWt3WV1bR9j+D2WxDqXB/5riuzjKlKf5gyaPReB67sH
	PgzTcDusGqgCS654bJKwy20PUjggWMXiDcrnC007NVpo1BeseQTlUCAmFYZVCa3GavxjWvRChljbH
	ATERMIyGxfvnfwjOa+T/Kqz6cnHaJfgrr9DxjYzAFs1p3ifVLeYTDP15kLUMLt9OQkceasWcUq+F1
	grbWireipX+iMp47uNHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7BuS-00FBJo-RJ; Tue, 11 Jan 2022 07:49:36 +0000
Received: from mail.betterbiz.pl ([45.86.209.138])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7BuQ-00FBIu-36
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 07:49:35 +0000
Received: by mail.betterbiz.pl (Postfix, from userid 1001)
 id C057D82ECD; Tue, 11 Jan 2022 02:45:44 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=betterbiz.pl; s=mail;
 t=1641887373; bh=07NAgW1e0WiNB9zqagiM2BnwZfWBCpNa2E4+ccxBPgw=;
 h=Date:From:To:Subject:From;
 b=yqC6OaBar8bbPGtFTUKgcBKfceq9TRB0dULewEbzoVzHVoYb0DkB98PBtSY/keZez
 pCLbFDLbAg8XWtSJrFGdwVtkmF9+lR4JbnzSecsMN2cJm1NMb9nKR6DmlffnI8c+jS
 ePKwDe3lODkTnLce9xjcseYaYzU4Xm3z2sP7OfM6iYGyE6UBCzoGiynMz6rPPZ8/ih
 w9PDJqitI+/yFQqaGnuAogu5AKxx64sCzJBqypf6oaDRv2RAff9bnS19NmF4nCtEiK
 v9z1oXT6vqphvoihYkp+3M7zrnZ7gKp9pMfKaXVmThONF/rfsNxMUe9wkxN/faI5RQ
 MJ7NOIc6C3BRg==
Received: by mail.betterbiz.pl for <linux-mediatek@lists.infradead.org>;
 Tue, 11 Jan 2022 07:45:38 GMT
Message-ID: <20220111024500-0.1.o.10j5.0.gwvmza8o7k@betterbiz.pl>
Date: Tue, 11 Jan 2022 07:45:38 GMT
From: "Jakub Daroch" <jakub.daroch@betterbiz.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.betterbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_234934_164331_B1D0CB9D 
X-CRM114-Status: UNSURE (   1.28  )
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
