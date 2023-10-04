Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FF9E8FDD1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 07:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mMhfBvhM53FtUQl1P3lyeSY5aDBQYiR8qQBy6YFQHi0=; b=DyAu7tODN6TfacE0lHc5PtCxAV
	pWTz7p4lFBECxC8+Yyrw2kC1Yjjl6KWWDnor6VO5mrQFgkqc6fO1zXcf5kqdAL42HAb9Hc/nT3gIh
	2/IepZPaY/RMeFwGgqkPuuKHDrCXNdf4272kS4DeE+0uBEnC6OOX2Ih/XCNAqbKkNwNjk3pebHoLN
	MxSY9/tZ1MCn4eYj0ELMo1/4eA/bv0efWvtGaQ5c7chLH2EOkNSNwTB3XzkGzR8iK2glV9r0bDhui
	kPZ24vOlvKa6GS9hF1uKX04P0ZP6sXjqo/51GHJYVYubvNuf9TmScaZwAVMJoVVPHabK0kqQw5QjJ
	g01zA4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwZz-00GfMJ-2x;
	Wed, 04 Oct 2023 07:45:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwZy-00GfLO-23
	for linux-mediatek@bombadil.infradead.org;
	Wed, 04 Oct 2023 07:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mMhfBvhM53FtUQl1P3lyeSY5aDBQYiR8qQBy6YFQHi0=; b=O6n7JJoBoVFWkpXqETL/j1Oc/2
	CBNBykkOkfSYEFv/n+gLQmZpXCt3lw1x/YDfIN9ncKZUrYCo5iTajQnx6vac/W2l2VitKsWFb69q3
	iPz7kloq5p50FVCoUms7bQREc1DwVdxRut01WhMjZuUtnSX+xrNPHsnpR2NmvtO5AobHk0IQKqNvp
	DgFhgFm5q2KjN9G1WUNB5a7wVxQ40ttVVCFm+vU2VYP+MnLJLSTEe4WGJ2uPXydxi9OI+Cf4Xt/ML
	4CmD8ZffqH3LlFXpppty7Xop2sQKFbPMloQyjYDFjCS0qO+8rUAYjJ6cMurSk9mVqBOiXFPMlfY4d
	Giyqxtyg==;
Received: from mail.citycodes.pl ([158.255.215.195])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwZq-00Aacr-26
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Oct 2023 07:45:55 +0000
Received: by mail.citycodes.pl (Postfix, from userid 1001)
	id C49E31F52F; Wed,  4 Oct 2023 09:45:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=citycodes.pl; s=mail;
	t=1696405547; bh=mMhfBvhM53FtUQl1P3lyeSY5aDBQYiR8qQBy6YFQHi0=;
	h=Date:From:To:Subject:From;
	b=QJiqfH5fD9tduXl04u+2G8R8nDSQRxAzPvIFunRjMtFea52+gQZY473fi0W4vr76W
	 t+YZfMYqZTMnJ2vkPhb4QPXn6KuuebUzkhD8TY3Ed++SDEh9fUcbq8CkB+DXSHW4Fr
	 DW3T8uH8lerXNDWflhpTqeUiIQ2KU+UEjqOqXZXwHLQbPxm+76hCzeP6FmCveJE5fT
	 fme3kAWJEwSp5KAXi/2CKzPy9Dknss56NlzyJSZiMGIiLX16o4oEfDpLuBEd+0ZGYi
	 f4IW3pRDie22cpg9HyqF+TawiB7FT8CLjYzEB6yIqO/YUlVbQ5BdF24bCHaS6v+bsd
	 cVShxPouiiIuw==
Received: by mail.citycodes.pl for <linux-mediatek@lists.infradead.org>; Wed,  4 Oct 2023 07:45:38 GMT
Message-ID: <20231004084500-0.1.7v.j0rc.0.g3nw4cja8n@citycodes.pl>
Date: Wed,  4 Oct 2023 07:45:38 GMT
From: "Kamil Lasek" <kamil.lasek@citycodes.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Rozszerzenie_Programu_M=C3=B3j_Pr=C4=85d_5.0?=
X-Mailer: mail.citycodes.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_084552_368118_8C15B53C 
X-CRM114-Status: UNSURE (   1.01  )
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

Szanowni Pa=C5=84stwo!

W ramach nowej edycji programu M=C3=B3j Pr=C4=85d mog=C4=85 otrzyma=C4=87=
 Pa=C5=84stwo dofinansowanie na zakup i monta=C5=BC fotowoltaiki i/lub ma=
gazynu energii. Maksymalna kwota dofinansowania wynosi 58 tys. z=C5=82.=20

Jako firma wyspecjalizowana w tym zakresie zajmiemy si=C4=99 Pa=C5=84stwa=
 wnioskiem o dofinansowanie oraz instalacj=C4=85 i serwisem dopasowanych =
do Pa=C5=84stwa budynku paneli s=C5=82onecznych.

B=C4=99d=C4=99 wdzi=C4=99czny za informacj=C4=99 czy s=C4=85 Pa=C5=84stwo=
 zainteresowani.


Pozdrawiam,
Kamil Lasek

