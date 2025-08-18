Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DC6CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Aug 2025 07:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C6L3HHo29AD7EhEgKSzsEghpyqJqAdv8Rupc8YaUwX0=; b=ifqG4irAF/CtzRoBQG0B1JR9P0
	w80HS8AnHHXU2EqFu3JwAcJaIMa+tO78WiLtNCQvGaRJ6eYF+7LD5aKVl7O+GaHUAX4vzMkAovftR
	S6vRgNX5yNOTx2oJ7MzL7VlWbuCfZhbhTJGjv/NkjNYVzSAQbxWg1+9XIv5nNxB1bIVx6zVUs/ex3
	UlV5gro3+tYUkvCSbYI/aHnN7YhCneZyIGPo4ifXgpe30xgs07Gc3S8bZ2eOi//su0xt5mEe4hozX
	9cgRkiEFWa8WYDxxYFpPbFIX5d5zz0f4ZpZCjAS2gMwhR4QMhfSvV2driwpcomDYIztWymkWZq9iX
	rqDjbU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unufW-00000006r6w-2byQ;
	Mon, 18 Aug 2025 07:52:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuQx-00000006nZr-3mes
	for linux-mediatek@bombadil.infradead.org;
	Mon, 18 Aug 2025 07:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=C6L3HHo29AD7EhEgKSzsEghpyqJqAdv8Rupc8YaUwX0=; b=kLRTM3ojYAj3JD5mNnOxX6K/h4
	/JfajQhYrZQ5S4/06lKejQWvsLkTIQ2Ldib0+JITfpHOQ8prbk11clj0K9r8ItVeugigxj5fpd6Am
	OK6ukek9ArRNIGwdyEIOUqcX01co/4WdY1+l4BvbLNkn9kjS99xaLDgFz3s6lCgtKqEFOkNzpjtU8
	+C8sODnGOw+p2WXAsocN369f/F22n7VHAASKbVV7+13tu5tA5U+k1dDUfQTYtDzMJRSrHE5quBtZe
	3aO1g+DXxH9GD7tSXg1STn7zs8BdXrCDrrgdvhTcS1m9fUcRWOYGEauWqDW1HFBDyMpaggN8w3kD1
	E1FHyiVg==;
Received: from mail.ventrazo.pl ([162.19.155.125])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuQu-0000000HIlV-35zQ
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Aug 2025 07:37:34 +0000
Received: by mail.ventrazo.pl (Postfix, from userid 1002)
	id A653522D87; Mon, 18 Aug 2025 09:37:25 +0200 (CEST)
Received: by mail.ventrazo.pl for <linux-mediatek@lists.infradead.org>; Mon, 18 Aug 2025 07:36:03 GMT
Message-ID: <20250818084501-0.1.kf.54hh3.0.j02wccoa41@OriginatePro.pl>
Date: Mon, 18 Aug 2025 07:36:03 GMT
From: "Marcin Wojciechowski" <marcin.wojciechowski@ventrazo.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.OriginatePro.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_083732_964107_87D5349B 
X-CRM114-Status: UNSURE (   0.89  )
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

Pozwoli=C5=82em sobie na kontakt, poniewa=C5=BC jestem zainteresowany wer=
yfikacj=C4=85 mo=C5=BCliwo=C5=9Bci nawi=C4=85zania wsp=C3=B3=C5=82pracy.

Wspieramy firmy w pozyskiwaniu nowych klient=C3=B3w biznesowych.

Czy mo=C5=BCemy porozmawia=C4=87 w celu przedstawienia szczeg=C3=B3=C5=82=
owych informacji?=20
=20

Pozdrawiam serdecznie
Marcin Wojciechowski

