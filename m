Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDDDC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 17:09:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1C0720715
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 17:09:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pla8AchG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ec4UNRWN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1C0720715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MGmaIcPTHMQLUEAJIT5CdiBFCiEB8KvqTvNtLi1qNqg=; b=Pla8AchG1EdP7JYAYQal4heJV
	1OnFoItn7ehRaUyuz5Qi02Mq+KN7gUuUA2nkmh8QyeaLvu8vS1g7hvsLheJAJdg5NY98HnoTK/N+C
	2S5FP2HhJFq3p7GWYy3sf/YRMonRbGax5V4JzK2o3fiLEnLr4H2NK2F+PcTVFE3sfFyEjTQtM8MCb
	PsYa/4hZk58YVpn5Am+tYLdtxZy6IdiC6ZiXcIOazLBG1AuYVpOmmlLN8JN8VOKMjSxkZJ9JJECfJ
	UapA/3V8nDraz2PhqvqLdTYAxSW7pPbPAIfuUCw+m4U3Vxn7TdyYeMe/ZZ9HyIqFNA3OWPac+3cTG
	K7UZvbGVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khbor-000828-Ns; Tue, 24 Nov 2020 17:09:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khboo-000814-DI; Tue, 24 Nov 2020 17:09:31 +0000
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2727820715;
 Tue, 24 Nov 2020 17:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606237769;
 bh=JE/XKDv219ahc78trmf4QDOLhTKFVqmxBCF2JSioF4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ec4UNRWNLGR6RwTKTnjzLAn4sURi8lQuEvTZcc5zu2R5cYt7qYqJ1PqoDzCIBou3A
 QSsFRyLhD0YI9s58P3nkgWrihKzdGgZdpWIwIOjnVd0U2tQ5se+c11rolL1Cb52mKk
 JzZqtSIpwa6IAxN3t/LD+FBvnBSPb3a4oFIch4Dk=
Date: Tue, 24 Nov 2020 17:09:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v3 7/8] regulator: mt6359: Add support for MT6359P
 regulator
Message-ID: <20201124170906.GJ4933@sirena.org.uk>
References: <1606103290-15034-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1606103290-15034-8-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1606103290-15034-8-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_120930_529123_3931B692 
X-CRM114-Status: GOOD (  13.31  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3209227498499430499=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3209227498499430499==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/jvaajy/zP2g41+Q"
Content-Disposition: inline


--/jvaajy/zP2g41+Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2020 at 11:48:09AM +0800, Hsin-Hsiung Wang wrote:
> The MT6359P is a eco version for MT6359 regulator.
> We add support based on MT6359 regulator driver.

This and the prior patch look fine.

--/jvaajy/zP2g41+Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+9PjEACgkQJNaLcl1U
h9AlNAf8DECrNSbsknU6bM5hQl8m/t6H1PgEtYza1esl6hv+LJ6jpdDeI+jgB7AU
1CuLhu8bgpb8D9JQVkd/IPbmg4CA9LOXCXeSoi4I7F38nc+MURan+m4z5BAwhM1V
NLAb0z472Y3+cPCyLg9qx7w4VP94kKEU0Sq2BNlIjWQPJtcmzWaj6YpWHmGhe9WY
DWFDFuGof7CcNt1DIh0ZiiMXR2QjHQVQKxsRl50zXt0oqpuQMP9Hfc0WVnf9mJ0I
ugQwYbjhA/kK5ehK7kJrfTNlGkVMffPpcYzHgfWICJfGUTz8SkTnAXdcEsyQOasY
youTWPS5qGzgUs4lg0Sg/akO263uCA==
=zKUx
-----END PGP SIGNATURE-----

--/jvaajy/zP2g41+Q--


--===============3209227498499430499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3209227498499430499==--

