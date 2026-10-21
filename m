Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A486B606A31C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 05:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rBbfZ8eb;
	dkim=pass (1024-bit key, unprotected) header.d=0upti.me header.i=@0upti.me header.a=rsa-sha256 header.s=mail header.b=dWOYFKWS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:MIME-Version:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqWlW6zqb5Tv2gMRTIRS9fn3wqc6RPqo/Vw3J/4+54M=; b=rBbfZ8eberxzqGZCKgf4AC1e7U
	xgcMVdS8BjZJYfnIPrA2UdLdZRaupEHIlmuqsm0xcGTsMwZT0tqzK4iXN1uo8DdmYkx8ur2Q50o8m
	0IEuHA8TWEJ8Z31PEypDxkaILa9weVG5e/1XK6OcSLhTF//YA0lAuUvcNSSlcwBfsUPrOve5cQDC8
	TvAl02m8arCQU+AJBzQ6qky4At3//HW5roteeFdLoiU4XTQqD0BSxwcAyFnneO48v0BmZotL5WlMG
	rWO07Cg9FlOLf+bLKPhd1EUbseFB5nRZbEXOBBa0gmkVnMEHMH6on19Luwv6qz4KbF9ubd6dC2Lwy
	YDW87T4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJOfD-0000000B56S-3vvk;
	Wed, 21 Oct 2026 05:14:59 +0000
Received: from forward502d.mail.yandex.net ([31.44.14.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJOf9-0000000B562-15a1
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 05:14:58 +0000
Received: from mail-nwsmtp-mxback-production-main-369.yp-c.yandex.net (mail-nwsmtp-mxback-production-main-369.yp-c.yandex.net)
	by forward502d.mail.yandex.net (postfix) with ESMTPS id 796A5C04E3;
	Wed, 21 Oct 2026 08:14:45 +0300 (MSK)
Received: from mail.yandex.ru
	by mail-nwsmtp-mxback-production-main-369 with HTTPS id fETbd21Loa60-gchyJVsg;
	Wed, 21 Oct 2026 08:14:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1792559685; bh=jqWlW6zqb5Tv2gMRTIRS9fn3wqc6RPqo/Vw3J/4+54M=;
	h=Message-Id:References:Date:Cc:Subject:In-Reply-To:To:From;
	b=dWOYFKWSNM6yJL42a9a6nhJrPaTXHRCAXCDvXZfz0Mj8MvyfAC7uZ0GWpe9jAS71L
	 FhE15RxA2+D6bYCjtCyfG3HcO1oYjnjjrN/j73Fn7xBU5sBdsxSfwdbjT+BcP3gsLF
	 4X1wciVB/RM0CldypHt6nJ/wUxcHJMUaBw2qw8w8=
Authentication-Results: mail-nwsmtp-mxback-production-main-369; dkim=pass header.i=@0upti.me
Received: by mail-sendbernar-production-main-96 with HTTPS id 52484760394db31a8bc30851e3f601b2;
	Wed, 21 Oct 2026 08:14:43 +0300
From: Ilya K <me@0upti.me>
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
In-Reply-To: <04b8b928-b671-4236-a792-1141cd81a34b@candelatech.com>
References: <1767631788532094@64c4e675-cd08-4a74-816f-886742f9bfcd> <529a79bc-dab7-aa41-00bd-c47ecbefaa00@candelatech.com> <471221788538289@323ca970-5bd2-4c6b-b52d-2b863a718615> <3acf531c-bcc7-412b-b3bb-665069260e46@candelatech.com> <2028561788553569@f088f4ec-f441-47a1-b7e4-75a1052aa4df> <2418461788691106@84aa39c5-f501-4e64-8418-6a8b6eb88e21> <eb405366-6574-4e4c-a89d-363751ed848b@candelatech.com> <4175721788798939@f00554c7-d809-471c-9bcf-78e5d8eceab4> <1556871789207706@7dc9deb3-4292-4932-8568-de9b411208d8> <1443771789748846@4a8ec5ae-80ed-44bc-b7d3-6bc660c90136> <211851789913261@df1900ea-d467-4ed7-a7f1-de68a4c3e6dd> <143991791036721@40be7595-980b-4665-ba66-1601e10a0899> <c4286904-2a9a-41fd-93ce-be57964909f6@candelatech.com> <221941791052355@558b3e58-c2b1-4e14-91fe-beb5649d18f6>
	<5955851791966910@d362902e-9931-4ad0-8e86-72401cc67703> <04b8b928-b671-4236-a792-1141cd81a34b@candelatech.com>
Subject: Re:[bug] Triple whammy of mt7996e bugs on 7.2+
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 21 Oct 2026 08:14:43 +0300
Message-Id: <93881792559683@cb540089-648e-4f63-be25-5737cfc54c1c>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_221455_493284_66E6F83F 
X-CRM114-Status: UNSURE (   5.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> You might try the latest mt76 tree from Felix, it recently gained a large number of fixes.

Well, that survived for a few days, but nope, still crashing :(

Maybe I just need to make it log the last few firmware messages...

