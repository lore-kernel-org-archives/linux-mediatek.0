Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D41CA0EEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Aug 2025 15:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E2sh7PkU99v95gXhyMFBk9zs8wQA9SBmo0ZEWgF1/ao=; b=Onv+ZB0W+iSkVX
	qgq0AGkhctVPoJzkQ3WDMPomrfuk8YxRVclPqH/NgWzAG2fgwUuUzXhpL5eaJ8gn2N2oOfncQQYAf
	LveRo7pkFnW6l8zPmi3OWLYwwStbqYIbwaNnmDpAQPPHINYJiDAoYFr3Q6AH0wTPYXohXE2KiYvnz
	oqasIFfDcNF8lrp8GNarnSff/j69pzNZYHSLdaMX7MuXh0gNBDa3k3zUo4MKWkmWfgfvtJpdh6bX+
	mJqNNyJzxFXlKad3BGu/ndGjLJdfz8jhl3Mg7bqbnTWmUOgQ3K8PS2lUto+3fm5iL8mjU3PMYW9ku
	KwOiUo8xfI1SnJ4ZtZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Mv-0000000HQBg-01cy;
	Thu, 21 Aug 2025 15:38:25 +0000
Received: from securitygw1.exwire.com ([216.171.192.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4fU-0000000GwVE-1wHy
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Aug 2025 12:45:25 +0000
X-exwire-MailScanner-EFA-Watermark: 1756384609.62489@jlLnXNo6R4iUE69oVvD+OA
X-exwire-MailScanner-EFA-To: linux-mediatek@lists.infradead.org
X-exwire-MailScanner-EFA-From: nancymc@exwire.com
X-exwire-MailScanner-EFA-SpamScore: sssssss
X-exwire-MailScanner-EFA: Found to be clean
X-exwire-MailScanner-EFA-ID: 216B326B242.A2008
X-exwire-MailScanner-EFA-Information: Please contact jdeverse@exwire.com for more information
Received: from smtp01.exwire.com (smtp01.exwire.com [216.171.192.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by securitygw1.exwire.com (Postfix) with ESMTPS id 216B326B242
	for <linux-mediatek@lists.infradead.org>; Thu, 21 Aug 2025 04:49:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 securitygw1.exwire.com 216B326B242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=exwire.com;
	s=default; t=1755776970;
	bh=HV6ngFc0kAPeZqm3RhmqrUX5EZoxx49VvdfM3cgWoeI=;
	h=Reply-To:From:To:Subject:Date:From;
	b=iMn5cDyDVm9yiY3J+ZYhh5EF8LKQilTqSEtmenl60VEfJAf300DdkVHqgf891jbS2
	 yT24QWnp/lrlOYztWFgteAM777riEwl6kansbkWK1n5XfnyEQF5y1U3YCp/pt4Hnve
	 KVKyjZlPQrJVyrjTdKCg9WjNDS+Km8P0sjtxSuGo=
Received: from localhost (localhost [127.0.0.1])
	by smtp01.exwire.com (Postfix) with ESMTP id A06EA47520F
	for <linux-mediatek@lists.infradead.org>; Thu, 21 Aug 2025 04:24:42 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at smtp01.exwire.com
Received: from smtp01.exwire.com ([127.0.0.1])
	by localhost (smtp01.exwire.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pL5jSq8jJIgV for <linux-mediatek@lists.infradead.org>;
	Thu, 21 Aug 2025 04:24:42 -0700 (PDT)
Received: from [45.138.16.152] (unknown [45.138.16.152])
	by smtp01.exwire.com (Postfix) with ESMTPSA id 2AC3F5825A7
	for <linux-mediatek@lists.infradead.org>; Wed, 20 Aug 2025 23:25:29 -0700 (PDT)
From: nancymc@exwire.com
To: linux-mediatek@lists.infradead.org
Subject: xl
Date: 20 Aug 2025 23:25:29 -0700
Message-ID: <20250820232529.7EF81C337B8F66AB@exwire.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_054524_498702_B69E2ACC 
X-CRM114-Status: UNSURE (   2.34  )
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

