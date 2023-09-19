Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996C5EDE989
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 07:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qCQG4c3C0tvkuSSy6okg6Td4OKi9mrw7rI9pE9SwJ9g=; b=l0qt/h6OgpEetYvux2I918KK3y
	ezLXHiagELJNEy99k9G8BHfFLvo76wUntV+NTkqnblfvqfWUrOAbjano+qI4ImT/QLSHUsurLkJRE
	1GXCIu+keuMVNUmwbMlZaHF3z4g62AM/dZ1oolVrgb5dsDxtuHxtLUaw64qcPCCJIn6UoMkwhwVXt
	v/5ad78PlJk36zhPJ5pOtZr6beee2ooLy2coEe1JUmqUq7B1joHMMGcJ7qOSwBmufpgjz2NQB855m
	NzZ99uREOi7CLBR113Bs9OmIcqelzpMegZwDD2BxLms12eSEI4nYUw6AaRjQJ1sx8jzRRXP2fBAqX
	sRZZydVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVCD-00HEpz-0L;
	Tue, 19 Sep 2023 07:30:57 +0000
Received: from mail.leeswilly.pl ([89.116.26.225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVCA-00HEp3-2F
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 07:30:55 +0000
Received: by mail.leeswilly.pl (Postfix, from userid 1001)
	id 5FBB97612DE; Tue, 19 Sep 2023 09:30:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leeswilly.pl; s=mail;
	t=1695108653; bh=qCQG4c3C0tvkuSSy6okg6Td4OKi9mrw7rI9pE9SwJ9g=;
	h=Date:From:To:Subject:From;
	b=oz5kFU7LqHhi3Jv/LQvU6MOsZ+bZzkoIOIzOnSFpckf8583a497q8IGsWBONJHOzG
	 A3gbNfIkofCgDo2hpeaxkSRPqDp5jqNyu6NB2fInuL0b1L0KXUeOv0hos5oAvY4+tJ
	 6J3lm42C9CZi7QxuCtRvib/8IQEbDX6xuZ9PJozvCGYMC7Ti7e9TjIHthrGPoKUzmz
	 p1WReWwcQ6lM1xdJruKTj1YaXRSkCvvkm5OdRQ/TTd56/yFBgt5v1ULwQzEO+tZIOv
	 qcUzp1JIctSCvmY34RS7GDBajENqhxnCPEeESCAjj4ctyEcWfMas7CerGARrIOqAQT
	 no/BBlFB/do9A==
Received: by mail.leeswilly.pl for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 07:30:18 GMT
Message-ID: <20230919084500-0.1.3z.bc4z.0.i3mosj8e9r@leeswilly.pl>
Date: Tue, 19 Sep 2023 07:30:18 GMT
From: "Jakub Lemczak" <jakub.lemczak@leeswilly.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leeswilly.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_003054_881709_23FCE81A 
X-CRM114-Status: UNSURE (   1.37  )
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

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam
Jakub Lemczak

