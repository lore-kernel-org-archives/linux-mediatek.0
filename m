Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C65C38145
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0d4YrPeddXF3RBWszuyX87hkfQXL7C/btVCimqkrzbA=; b=1AWWjKYz9Py8Of
	nt0jhfl7EOQwzNprzd6gRvLYeKaHlxTFWaWFXLtwTUkn4OYtOD6Hol6jZWawmRHU/xSWkrABLe5vT
	ER6EN/wlj71/nghCHrYPLpqwrEwlzW1by8QsqGS0U57QCsp6YKp74htIu/sH+8BQilDzogCH4jve0
	5S0cyWAJHda+4PJSDh2Omal6giqBWVrPSh6ty9is5ZxWnqmmRZzBv/Qq/d+eMcajYaFFV6DG+6Zj5
	IdCAAf7Yk88+vv7H5bK9bSV0KkEUE5dXoy+EjZyR3twbhAtR3yhKLoIQ+AVnmr//FgFQoVX9RERSg
	xP03AqzmNf1izPY/OhUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU4f0-003tx3-El; Fri, 02 Sep 2022 11:16:30 +0000
Received: from gxaoszxo.piglight.com ([85.217.145.3])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU4ex-003tsy-Nr
	for linux-mediatek@lists.infradead.org; Fri, 02 Sep 2022 11:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=piglight.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding; i=and.sco@piglight.com;
 bh=2RNxICSB08QOsISrgdgjONv4BIM=;
 b=ezKpMDSBMeF/8a3qPxopa3vyOzfdf7DRo0qPQx1m0wEX+4KcWZKJl+G+wRT0xpn8oGP/5s6En2vh
   VXmw5kzXxMJSkWR+jabNxLKDqljjCAHwe0rphFk1duehYU3hV7yGU4ew2wuPsEHb3PnRLlpjrF/t
   w17U8n3FxYLfrTKspXQVTsRKieNl70/ob18n9khauYgi0FhGnVJDQvRKhCQM6pqA3oz+BlXstqd3
   WPKgUPCmDsnrZQBjlbBVzLN+sSQUxS//7AWRoME1sV0VAWRBVhmfxzr8SlWNXAKh/+1UDXG1GD01
   6ng0VVYqhZfi03Ii+pupONUNhznfPwq23qxgIQ==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=piglight.com;
 b=OMz/t9v4EawQi7QYu3i91oDIAN5vyUzTzZxLI1CbUlIS2wr/yHErXO5P/p8PBN8ZLMfNlGDl+4Dv
   zAGpRC9AFtEMg9NRTx90IdcVlcj+U29uXYMjHVu6g43xoT1a7yZEQ2UK2PWjBs3vnhMzyaKcwFJh
   2O8VXYao1rqVc5YFE8we0/rW32bor58foRCRUVD88MQZ4abP38zOHBEcTUecvAjz2PDPgv+my4S2
   X6qRINVChIt072OxNyqeRz7kRlVfN3NXp7+Eo5XnvjX3LR0tZiqIV8Lv/+A8OY2emUx9lpLGqbex
   MZxIBb05OxGlIVrz4hKWEkyGdi5hZ5Fc15G/FA==;
From: Amjad Ali<and.sco@piglight.com>
To: linux-mediatek@lists.infradead.org
Subject: IMPORTANT!! Sir, I need your urgent response.
Date: 02 Sep 2022 04:16:26 -0700
Message-ID: <20220902041626.22DD1946237D2E93@piglight.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_041627_958074_743F1146 
X-CRM114-Status: UNSURE (  -2.45  )
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
Reply-To: amjalia90@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Friend,

How are you doing? I have sourced for your contact online and=20
decided to contact you. My name is Amjad. I am retained with a=20
leading Bio Firm. The recent pandemic caused a lot of havoc in=20
the business and supply industry. It also opened up new=20
opportunities as well. My company has opened up a bid for=20
suppliers of some basic raw materials needed in the production of=20
life saving vaccines, drugs, etc.

I urgently seek a representative to represent my interest in this=20
bid. As a staff member, it is against the policy for me to bid=20
directly for this. I assure you that the proceeds from this is=20
very good. I have already sourced a local supplier to work with=20
on this. I only need a reliable representative. I think we can=20
work together on this.

Please get back to me and I can explain in further details.

Regards,
Amjad Ali

