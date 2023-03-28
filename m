Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A45C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 05:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:To:Subject:Message-Id:From:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MThjatOvmvG2ud53iY/JFats0mGN8ATImNEA9WFnq70=; b=PFCMu/2j7n5QUIpnPSQTZ0RZoa
	8+FiICCFdunE5stR2fW8LSZDf+t30JB/JveEuNf2uMyI3llsL0EWzC6zPYtPRCpPTX6SEAW8LFLIK
	VBhffTaievPJqefBcRlhMBA1uvhdPTyOQXoMOPwowg5kxp5IInSscCaADAo9VX19Gxk5dP1vDuDYF
	gwZjQyHOdmF8+HxMq2esr6Tyn4Ebvojg12tWu1g5n9y1RLJVFB2SokC/FJ0ZvRxpZe4T6xwCnc9qp
	8V4xg8Ntfl+ZV9/OmQF6JtFJzS3vRQMJ4mFWDeq+JL1ycI/lARhKNHlsXQSYze0z1EkVOWGgv+Jqy
	ATVwkFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph1ar-00D9tI-2I;
	Tue, 28 Mar 2023 05:10:01 +0000
Received: from boar.birch.relay.mailchannels.net ([23.83.209.250])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph1ap-00D9qi-08
	for Linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 05:10:00 +0000
X-Sender-Id: whogohost|x-authuser|irinajom@wgh15.wghservers.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 9F75E26063D
	for <Linux-mediatek@lists.infradead.org>; Tue, 28 Mar 2023 05:09:14 +0000 (UTC)
Received: from wgh15.wghservers.com (unknown [127.0.0.6])
	(Authenticated sender: whogohost)
	by relay.mailchannels.net (Postfix) with ESMTPA id E63A0260DD3
	for <Linux-mediatek@lists.infradead.org>; Tue, 28 Mar 2023 05:09:13 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1679980154; a=rsa-sha256;
	cv=none;
	b=72akAHy3+xlc5sWPPOL6r+a/MdXUV/F7Ro1NEtL8FS7f5JearmssxQmhK9AIv8e2GlQrX4
	Q0ymBraHwOuu7IC1gZxOVjW6Dicav71wyhgsHqmYZsX9N4JXeExjNEbbSGbgL++efG0ajo
	6FfPkLk5P8nR7bF8GcYMRatvr2LtgfKLT2GlKsSgavzm1M51TOhyETXm6NeIjQoaqsAOMj
	7gCbTloBa1PeRtyXyOXvkrPztJvfptS8v66hqjmOaMGPdzxiojKP+5VDxAHJCLCjL/4hQn
	uBN3D40qEBRQp+335hADjBg0oz7T1emww6W3aE1K8njliKZO5AqBR/RJwsBn5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1679980154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MThjatOvmvG2ud53iY/JFats0mGN8ATImNEA9WFnq70=;
	b=dmAFIsgm1kJawaTsX5TKBm3nW1ZzCOHItFnVcmxcLn6fuPGvGoW5/Ea+ewp7Oy0P7+2yr8
	lCIsyrtz2EctlgZvRALRcX8rpvw/GtwmtqmJ3Bh1rKGeJxTOR787ccgIgQQpGInpsDdNnE
	BmFBYAcvYmLHwghSaaKepELUav6z7dbpiJe3bcIR2eg6YutZtCtCpNr9+uAjuIh1WWQk9J
	6I+ii4hEBO3eW0DLjvBl5dCPKL/Z7ukgdQIBRX1UNzgMl8eO+UCSc1MpwhyqwshZROrYtm
	g5wg8vYQxwq+yir6yaPbsGKjgtTFw1+tGoODdO5oebVooFRvOipxKPx6yZ09gA==
ARC-Authentication-Results: i=1;
	rspamd-66b58c76b9-488z5;
	auth=pass smtp.auth=whogohost smtp.mailfrom=info@irinajo.me
X-Sender-Id: whogohost|x-authuser|irinajom@wgh15.wghservers.com
X-MC-Relay: Bad
X-MailChannels-SenderId: whogohost|x-authuser|irinajom@wgh15.wghservers.com
X-MailChannels-Auth-Id: whogohost
X-Troubled-Tangy: 5d6429386dadb32a_1679980154108_4049495563
X-MC-Loop-Signature: 1679980154108:684174758
X-MC-Ingress-Time: 1679980154107
Received: from wgh15.wghservers.com (wgh15.wghservers.com [23.94.186.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
	by 100.116.217.215 (trex/6.7.2);
	Tue, 28 Mar 2023 05:09:14 +0000
Received: from irinajom by wgh15.wghservers.com with local (Exim 4.96)
	(envelope-from <info@irinajo.me>)
	id 1ph1a4-0007RY-2o
	for Linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 06:09:12 +0100
Date: Tue, 28 Mar 2023 05:09:12 GMT
From: "Irin Ajo Mi" <info@irinajo.me>
Message-Id: <1679980152.Eeg7RrDx4jwY6EnW@wgh15.wghservers.com>
Precedence: auto_reply
Subject: =?UTF-8?B?VGhhbmsgeW91IGZvciBjb250YWN0aW5nIHVzIA==?=
To: Linux-mediatek@lists.infradead.org
X-Autorespond: Irinajomi "RECORD`JACKPOT`1350165`DOLLARS`CLICK`HERE` https://malko6.page.link/FyYN"
X-Loop: linux-mediatek@lists.infradead.org
X-Precedence: auto_reply
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-AuthUser: irinajom@wgh15.wghservers.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_220959_231977_B082891D 
X-CRM114-Status: UNSURE (  -0.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Hello there, =0D
=0D
Thank you for contacting Irin Ajo Mi.=0D
Someone would respond to you shortly.=0D
=0D
=0D
Best regards.=0D

