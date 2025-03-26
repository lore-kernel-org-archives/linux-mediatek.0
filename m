Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F75CC36010
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Mar 2025 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=; b=LkNcHavZhciRMUGcNn/SLR1P1Z
	aJZQDt2x8PglR7i3Mrz6XiI74vPC3+COFiHrwSAZkX0KxjBrXf2t8wWyGd8C/VhPVv7ez6FDGNait
	S9LsZ76HP7oyKHF0B3ISylF3lBlyt9fVkobqaOdNow61PIQpmuRansJfnoquKdSIHYGjiuMwHApyw
	9itlrF6BogsqyZA0aNQq5B81GiLD6UtLMJaEnL/XaI9yre8+J/HrI8Uh+tWD3nwshMMUPcPGVC3gd
	0NUuC6azu1Rqwnrh2ijZl+HCdOoHogXo2PILeN93vx9zvtP4iCCzqD7ut6TrQ7RuCc2qEAUN+nDEx
	OlMwKyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMR0-00000007xVN-3Zte;
	Wed, 26 Mar 2025 08:48:26 +0000
Received: from mail.corporix.pl ([151.80.59.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMM9-00000007wpw-1qPs
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Mar 2025 08:43:26 +0000
Received: by mail.corporix.pl (Postfix, from userid 1002)
	id 0C74724CB4; Wed, 26 Mar 2025 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corporix.pl; s=mail;
	t=1742978188; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=izwIRaF81nZ1dT54guG6a6ubzwHQmbgc5kMRp+eBS6v0Lbl/xB2HWTfJyBe3/qxQH
	 1IsNw/nR929XdAOSgE0YDsK8uHbFIJwosgk7WT9EbOBZhnR3knLU/ZVzofPKN7GIZj
	 CEc7mQfFnzaZKm4caRHbjT5j/kAV+9Sce3ufPBNTStcJ9DlrfTIU5qbj/NypG/tnL3
	 RkelgjL/P0KzJ8kdIgZIB/AWfRN69r8pH2AzavRmegC6I2nYALprFi7aJbzD/N7VuA
	 CslJsM4D/ud3f6aNLwfY9hSTpVQlBTKz5RsvWHxbEIJ0YNpT9yZPxgAKJxIGdmHAkf
	 C6eGEGjmHCorg==
Received: by mail.corporix.pl for <linux-mediatek@lists.infradead.org>; Wed, 26 Mar 2025 08:35:44 GMT
Message-ID: <20250326074500-0.1.16.c5bi.0.ob4m7iwxq6@corporix.pl>
Date: Wed, 26 Mar 2025 08:35:44 GMT
From: "Patryk Wysocki" <patryk.wysocki@corporix.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.corporix.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_014325_615372_12EDE952 
X-CRM114-Status: UNSURE (   1.47  )
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


Pozdrawiam
Patryk Wysocki

