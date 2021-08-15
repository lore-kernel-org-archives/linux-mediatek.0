Return-Path: <SRS0=EFw0=NG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F45C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Aug 2021 12:34:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF5FF60F4B
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Aug 2021 12:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF5FF60F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=oFmvesikMur+hBpb0m87eNs2mWzLopi49zPo2khsaKU=; b=iBr
	iybrY/LlsvfdLLOwxm0aPFoj7KQ6A6vwMryCHa9epKNOlTZelF6BTA6LuNBJOmNxOwW2fA1F4j14N
	C6Adhvw8CfKRCGF0I/5Tm2OSjEwp/WxIz6etwcDgTfp1cgRz3knW6Anau2NmB43EShdU05npVpCUf
	UQPy/t0yUjwgPIYvWsmU6nboRyWIEUBgGT+t23GJ+36vCWEUWaBCk9px0cy4R6fStvyiRs3kqGK8G
	lylzV3R5RHPc9mzV8TkgJUrEDLDWaFdH9xMzPmIsJFSJa1b+vfJDzSoay7grYBVj2PMazRgI59+UQ
	1e+4zdvtE3A8VHZdXXW/wqEjJfYcTdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFFLi-00FHxR-Ik; Sun, 15 Aug 2021 12:34:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFFLf-00FHwt-Mq
 for Linux-mediatek@lists.infradead.org; Sun, 15 Aug 2021 12:34:45 +0000
Received: by mail-wr1-x42b.google.com with SMTP id h13so19797484wrp.1
 for <Linux-mediatek@lists.infradead.org>; Sun, 15 Aug 2021 05:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=myQpsu2YZqoOzqeDH12HY3Xgnj+gPy8a/LbU84KVEWQ=;
 b=M9cY2+bcu7Mv4Lw9wz3A0qskCqOs1fDjjhI3RBaKkNdp+7jsSdrZVcaeVZPP4h8V/Y
 FWTD0BEqcRMwZxbu/3q5iSpijFjbM4xZ494xWEjhhuYWfdz3r3D6/u+PCKmC51bDVB6Y
 L9CNIY5H1iffaaued3prOLE3jfgFTYcwfCa358GWaQa+C/L0vR0SiiyFnhGltEfTiBUz
 auwwvZQyyOBoFS/f2PJeEm0tTML7niNC8917c6NLNiU6aTNGK0Ja22nffQDGfhnWRsWq
 NOkeWqogBIFhwyDON4SwEdlWziGby0NdJEq+INAUh+fCYprS0KseRSCE9eqraTzDfJ0y
 uLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=myQpsu2YZqoOzqeDH12HY3Xgnj+gPy8a/LbU84KVEWQ=;
 b=KtrtYaXu5tUZuqYPWNDFXuCMnF5c/7lACwcbrsXEriAagpWxzd+VRExIL9Bvlw4fWD
 xm/HvQI5BF4F2846uxdio4WBVO1aengmBNt5Th19RBU7Yn1oNhFsifIbda5+8T0zDyXm
 vaKT1rT3s7MoONRowf+8dxx+1E46XIV+8aN4Xx6GVQubdxYuvG4IFx4Fa3wQ4pY/fPz5
 1m4sz5cfpHjHssk6MOJsBGYx4PvUrb/VzTqQ+TbNjeBEskRKui0crh3imO8BXS2fPvip
 g8CUI8MKZUbLV552waLp+tzfyGBquebaotbpIiVSkNjdygFQWPB6k1b5aXpp+z6erbIX
 DskQ==
X-Gm-Message-State: AOAM531eqlepwYVSkAS3VCA02Njn3T3OW5o03L+7jtNDvpmPvbbbcGVi
 qTZ0HcXFfou+fTUjyqmEy4uHW1gixHg3lnY8UbihRkKxLtk=
X-Google-Smtp-Source: ABdhPJz0uPjMNL9ObECy7WzLv808PdMngCYC8CqitCI7LvKq17SyuREH9WA4p0jbcUUDQiOcZyxuGE/k3vr9PCmTt78=
X-Received: by 2002:adf:ec81:: with SMTP id z1mr13193651wrn.181.1629030879584; 
 Sun, 15 Aug 2021 05:34:39 -0700 (PDT)
MIME-Version: 1.0
From: Alif Ilhan <alifilhan0@gmail.com>
Date: Sun, 15 Aug 2021 18:34:14 +0600
Message-ID: <CAPfpOrZUXRw4A=p+7r6pZRHvXrBvz=3Cz2xMcoJH8PffdErW1A@mail.gmail.com>
Subject: PMIC drivers upstream?
To: Linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_053443_804807_20056EC8 
X-CRM114-Status: UNSURE (   3.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, are there any plans on upstreaming mediatek PMIC charger and fuel
gauge drivers into the linux kernel?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
