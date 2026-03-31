Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE0310F92E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2026 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95J9+dCH3cWEBjsztolgGJJchHofbcIg6SN92OQYi2U=; b=e4mpdsTpBDnDlMiV6+cdwLpufB
	fDVQzfyiX9N2hblN18WP1yWusm8SeNnKHajiG4/lYCi0u3XsbbR9T7EhBg3MZf0mE3W0uPPohSo5W
	N2uxkG+kS9YuwF9fXjpkG7v4NR/7uK/jXjJFrnzKAO4Owo1s84u1Xm6OL0SfceXG95rXj9QRHmbXn
	JdF9KhlGc4cAiG3zPu8UlGuPszTaBaIyJwk/DHAoJMXlvwXHOvbbfiNz2iKb9L2+qiDyWfDHpvZUw
	dyyOSaGxtsfZhSl1txWpbh2FAOXU2SP4AX9nICyRKGc7Qp3jPQj6G6l2QAclC9bO36zfpJEqhIF6d
	Jb5RJb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7c9q-0000000DH0O-3jug;
	Tue, 31 Mar 2026 16:41:38 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7c9m-0000000DGzU-3ByH
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Mar 2026 16:41:36 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1774975286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=95J9+dCH3cWEBjsztolgGJJchHofbcIg6SN92OQYi2U=;
	b=nBx3QgdFYM5Lz/4mGKLt76lC7U2D5MBD4ndIGR9jqfDzEDeuKGYfxISmZrbVYGzh0VmCwk
	aul2gOtKyCsyrLU25+Kft8/cciHCDGWchB4+Zwq4LcIV2QaG+rteE7FTYa6W2VPex3gYoI
	zov3L24fhXDozqGCNPwUJDPgJ/buoaIyYOqb7E6hOp144lwgJ/nv1NE5PoqPMy4Oy9ojtT
	54hVbAy+gfYYvQgAXfXE/pqIbOY8rg4P4bwmSpS99pEARGb6RDPBThHbZrg9jNljnFWRQ4
	DgmHGTGWg0ndJbDr2OwvN826OqQo1iUyTu1CyzJGFgdCeQh71sxDIOgz7ZIPLg==
Date: Tue, 31 Mar 2026 16:41:24 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: lucid_duck@justthetip.ca
Message-ID: <630ad945be38b7a97ffbb2a02524b7728c9efcb7@justthetip.ca>
TLS-Required: No
Subject: Re: [PATCH 1/3] wifi: mt76: connac: use a helper to cache 
 txpower_cur
To: "Felix Baumann" <felix.baumann@freifunk-aachen.de>
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 lorenzo.bianconi@redhat.com, morrownr@gmail.com, nbd@nbd.name,
 satadru@gmail.com, sean.wang@kernel.org, jonas.gorski@gmail.com
In-Reply-To: <3f4103d9-4871-4ae8-93a7-d286fce37443@freifunk-aachen.de>
References: <20260327021534.448552-1-lucid_duck@justthetip.ca>
 <3f4103d9-4871-4ae8-93a7-d286fce37443@freifunk-aachen.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_094135_311460_02269591 
X-CRM114-Status: UNSURE (   5.40  )
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

Hi Felix,

Thank you, and thanks for reaching out.
Yes, absolutely -- my real name is Devin Wittmayer.
Sean is welcome to use it for the Co-developed-by tag.

Cheers,

Devin



March 31, 2026 at 12:59 AM, "Felix Baumann" <felix.baumann@freifunk-aache=
n.de> wrote:


>=20
>=20Hi Lucid Duck,
>=20
>=20thanks a lot for your contribution. Very much appreciated :)
> The kernel has a strict policy for contributions: real names only.
> https://www.kernel.org/doc/html/v4.11/process/submitting-patches.html#s=
ign-your-work-the-developer-s-certificate-of-origin
>=20
>=20May I kindly ask whether it would be okay for Sean to use your real n=
ame?
> https://github.com/Lucid-Duck
>=20
>=20--=20
> Regards
> Felix Baumann
>

