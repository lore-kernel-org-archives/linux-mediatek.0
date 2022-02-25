Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD4CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 08:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OTZcMG79Z5dYQylbpGAJUyk7N8KnSSEVIWi8E1/R3Yg=; b=ZYQWn6cnV4vZLh
	hNQDrncYganJpY6j7w0nDNuM5DcOPwelvsVnQz0m5/y8tR0ZqmDF3G6h/sl1OLNFlwO++3LrhNiF6
	Ar4+nQh0fgM72GrnHhnb0jGEFSo6+mK4EENoYyxVTeimTcbn7UFnnx9IiMIp+jTQZ2qypp474YCxz
	SX7jRGpu/ko9maBCXRlkmMKKFJRc6KM/rHHQDq66N/1BrsoufmRmyyM4KeP2khH0rVEnu2JcT+Rsu
	8E6qJnwekDRPCImZKLomUDyTOPuS3JkSr40UHlwUiCLjxi4VwZDly1qRT2Vh6EYcqyOZtq0tQkWzP
	gLSgji/H7lYSTohEt+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNVj0-003sGA-MS; Fri, 25 Feb 2022 08:13:14 +0000
Received: from mail.powerangels.com.pl ([45.86.209.159])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNVQR-003iuB-U0
 for linux-mediatek@lists.infradead.org; Fri, 25 Feb 2022 07:54:05 +0000
Received: by mail.powerangels.com.pl (Postfix, from userid 1001)
 id 0B5A883419; Fri, 25 Feb 2022 02:45:30 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=powerangels.com.pl;
 s=mail; t=1645775227;
 bh=07NAgW1e0WiNB9zqagiM2BnwZfWBCpNa2E4+ccxBPgw=;
 h=Date:From:To:Subject:From;
 b=Pff69Euz9w3XTAYhEXIDyCOTy8GoqPA0FFFZtRc2AbyMlCFdnUtbEYgE/X+wv5vr9
 WZvJ++UTzoXKZStNOXFJuwMaH52jiCHlXDmhrxGMdvN0IlRxHkrqao2bCj5wUEFE9p
 bW/4T9s1ZojiDCfx4YM5fB+lUgLYVSm/WcayqbYqmHUXe538imSF2X6J+EiQFM6tea
 +QN3qvY395IBLdMtnC10fFLRRNLMEP8PV/nt6bk36CPGt+m2+4VF8TS9PJxxa4rfRQ
 FcQDM8h8ozjnZ+lNPXI/AGzyPnHuj9lMTcuX7jLFS5wgs2pge8gQu6ha+EVWYENQH4
 Gqg5qAQ9MEKeg==
Received: by mail.powerangels.com.pl for <linux-mediatek@lists.infradead.org>;
 Fri, 25 Feb 2022 07:45:21 GMT
Message-ID: <20220225024500-0.1.j.20hs.0.svlda2e82s@powerangels.com.pl>
Date: Fri, 25 Feb 2022 07:45:21 GMT
From: "Jakub Daroch" <jakub.daroch@powerangels.com.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.powerangels.com.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_235404_047120_1C1D1E35 
X-CRM114-Status: UNSURE (   1.16  )
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
