Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F438CA0EFF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Aug 2025 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E2sh7PkU99v95gXhyMFBk9zs8wQA9SBmo0ZEWgF1/ao=; b=AIV+gWC7heYA91
	uYz7w6HobefhCShaKhNdSo3tIOOH/VqBoM+5qSAUJhqK9YV6ABql6LNWFbXlwHyVdjDYHi1fkz3t+
	MAah+/AQFvPOLf3Hr7lA2/GTrYVhXuzlWlyRO1tEMr2KrRsXKDKmWSKEYMDhhEbCTrvtEr0dTSS1w
	J2eNCS7xhFThnJh5CFhtyBcMQLb35gNWva9SNynaQtQTBApbDFecQOmupSSfMG35XMbesRUZOxO9D
	zW0JZwsv8m18t3rjCO+IqfKqhoAfDT2rXEgtN5QGqYCjGrsw6tNNiCybcvDrUFffUVd6aaCovjHhR
	9x0XBYy+myzNnaIzx4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usQUt-00000008JBa-3yl5;
	Sat, 30 Aug 2025 18:40:19 +0000
Received: from mail.saluslaboris.com ([170.231.171.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usQUr-00000008JB3-1Pp3
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Aug 2025 18:40:18 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.saluslaboris.com (Postfix) with ESMTP id 70EB4DD0AFB9
	for <linux-mediatek@lists.infradead.org>; Sat, 30 Aug 2025 13:30:49 -0500 (-05)
Received: from mail.saluslaboris.com ([127.0.0.1])
 by localhost (mail.saluslaboris.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Cycy8n2DHHC1 for <linux-mediatek@lists.infradead.org>;
 Sat, 30 Aug 2025 13:30:49 -0500 (-05)
Received: from localhost (localhost [127.0.0.1])
	by mail.saluslaboris.com (Postfix) with ESMTP id 621E2DD12AA4
	for <linux-mediatek@lists.infradead.org>; Sat, 30 Aug 2025 13:26:48 -0500 (-05)
X-Virus-Scanned: amavis at saluslaboris.com
Received: from mail.saluslaboris.com ([127.0.0.1])
 by localhost (mail.saluslaboris.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id VZlheObNZpGc for <linux-mediatek@lists.infradead.org>;
 Sat, 30 Aug 2025 13:26:48 -0500 (-05)
Received: from [45.138.16.152] (unknown [45.138.16.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.saluslaboris.com (Postfix) with ESMTPSA id F2D7EDD141B0
	for <linux-mediatek@lists.infradead.org>; Sat, 30 Aug 2025 13:21:16 -0500 (-05)
From: edwin.herrera@saluslaboris.com
To: linux-mediatek@lists.infradead.org
Subject: xls
Date: 30 Aug 2025 11:21:16 -0700
Message-ID: <20250830112116.295706C801BBEC4C@saluslaboris.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_114017_511289_38C14A00 
X-CRM114-Status: UNSURE (  -0.29  )
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
Reply-To: info.superenalotto@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Wir freuen uns, Ihnen mitteilen zu k=C3=B6nnen, dass Sie zu den=20
Gewinnern der j=C3=BCngsten SuperEnalotto-Ziehung in Zusammenarbeit=20
mit Lotto24, EuroMillions und Powerball geh=C3=B6ren. Sie haben einen=20
einmaligen Gewinn von =E2=82=AC3.850.000  in der zweiten Gewinnklasse=20
gewonnen. Um Ihren Gewinn abzuwickeln, senden Sie uns bitte=20
folgende Informationen per E-Mail:

Vollst=C3=A4ndiger Name: Land: Wohnadresse: Alter: Geschlecht: Beruf:=20
Handynummer: WhatsApp-Nummer.

Im Namen der Online-Lotterieabteilungen SuperEnalotto,=20
EuroMillions und Powerball gratulieren wir Ihnen herzlich zu=20
Ihrem Gewinn.

Mit freundlichen Gr=C3=BC=C3=9Fen

Frau Katherine Federico
Leiterin Online-Zahlungen / Validierungsmanagerin
Code-Nachricht: 737GHS98

