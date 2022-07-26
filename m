Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4588CC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 00:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/WDU4tI4EEY0hnCnjZh/nF+JXQXLA4WTQdigik0Ic4=; b=NoeK6/mf7xywbuU789A/0E2CHF
	ctfgkEBzw/No3wWt3acgJ4H86JmnqEUSD6a6SZ09Qb29OQ+J8nFsFuKPLIayEENTdyvgVGnERr9M7
	t4OJ++igCiN9ZSiv+uCtdThv6HasXyA+cUH8gkL1lc72h7RftXukBVuXSGQ+zyU5yPmG4p+JvgERr
	7tA5KE2uZ1mjX4ZUfK9wTTBMOyncU5edD/kV89M39SPvlMVJ+vr8YQOv2RsqMZzQlDz/bMcYJySYD
	9gSKcshK6uj+9U1L1yWv56Sll1ow3p8OsB60c1/UQmUO2d3AfgQGDAyCQitSWSDqJsUZxkWuk2qNc
	2gvbSrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG8n8-006Vwi-G8; Tue, 26 Jul 2022 00:51:18 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG8n4-006Vvp-Js
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 00:51:16 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 7AA765C00CE;
	Mon, 25 Jul 2022 20:51:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 25 Jul 2022 20:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-id:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1658796667; x=1658883067; bh=M/WDU4tI4EEY0
	hnCnjZh/nF+JXQXLA4WTQdigik0Ic4=; b=kz4Nos2R91H+Y/HSHwa3fK0mriSIg
	yOQSPi66heTQsTc8F/Ssi0nc7cGKYQa1SFewibQM6AcOvbH42XPqDjoruYgJeh8c
	k+cn7kyQ8bDX5tbnLqcPyMEKISbA3Nis7jN/r2Wo2OnXap+ssqqT53dSOD1xyIlP
	8Cz5FRgAkY8kPdjB3juC8NlJlSmpRvDUiNzeKcPCxPR6SY26O9VvkaRJUYkMj6LI
	h9JEYRZPoLMXJqBu1xsqtV7el+vBlsYdu2HcwIYGnsiv9DtPVGxkYWzb9Pcf3DHl
	nF+LDxqz9zYhEPazTZ6x026Cx18hDUR9/IIueSXkxuuoTXlNkcVHzt79A==
X-ME-Sender: <xms:ejrfYkHwlcOVbt5uSdqiw54NQiW2e_5L9UhAQyovTmJFf_0Vibm9NQ>
    <xme:ejrfYtXNkx4ajqIK2qjSC77IHWfjcdIQdLcgbUtLZjG5ljARXV_IMBOoDq-djliBf
    6o2nBvfP-K6dmR3DPA>
X-ME-Received: <xmr:ejrfYuJZmD0ZMRjUhhjf5deI7vVORzg4NMUwkedmsqfC9DuSnvf5lxmNTNt9WVQ9WHUBIoGw-JzoEduwE2Lf7LuTVMInebROQwo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelfeeklefggfetkedukeevfffgvdeuheetffekledtfeejteelieejteeh
    geelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:ejrfYmG92jeKIuULGIDi9eWnUMdBm76bMgOHtGxThbHLlOXJjzKrUA>
    <xmx:ejrfYqWM9z3zPiKkLZqIcKJamahnx0t-NLeJWfh_stHyTtlIyIGinQ>
    <xmx:ejrfYpO8xQkUEoTxJ7UvSDo243o2dfLepHoMdmvQ5UQCjDA4NUCGrw>
    <xmx:ezrfYnW8zRNLUCZecqZhCoVcgesHz8tNjqbhh8z_5p328QtaVnBOTQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 20:51:03 -0400 (EDT)
Date: Tue, 26 Jul 2022 10:50:56 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Bart Van Assche <bvanassche@acm.org>
cc: peter.wang@mediatek.com, stanley.chu@mediatek.com, 
    linux-scsi@vger.kernel.org, martin.petersen@oracle.com, 
    avri.altman@wdc.com, alim.akhtar@samsung.com, jejb@linux.ibm.com, 
    wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
    chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
    chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, 
    powen.kao@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com
Subject: Re: [PATCH v1] ufs: core: change comment message to popular format
In-Reply-To: <e962c613-7bdc-99f3-4273-b91beec614ee@acm.org>
Message-ID: <f396dec0-67c2-30f-5be5-c99ecdb985db@linux-m68k.org>
References: <20220725131558.13219-1-peter.wang@mediatek.com> <e962c613-7bdc-99f3-4273-b91beec614ee@acm.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-132907978-1658795837=:30080"
Content-ID: <b9adaa9a-2967-e8ad-e5ea-2b1882b2b18@nippy.intranet>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_175114_767279_CE0B4B94 
X-CRM114-Status: GOOD (  13.80  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-132907978-1658795837=:30080
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <90cc7f52-fc8e-aee1-574c-ae11d18adb8b@nippy.intranet>

On Mon, 25 Jul 2022, Bart Van Assche wrote:

> On 7/25/22 06:15, peter.wang@mediatek.com wrote:
> > From: Peter Wang <peter.wang@mediatek.com>
> >=20
> > Some editor cannot display =E2=80=980=E2=80=99 =E2=80=981=E2=80=99 in c=
orrect format.
> > Change it to '0' '1' for most editor can display.
>=20
> As far as I know checkpatch accepts non-ASCII UTF-8 characters. Using=20
> this encoding is essential to spell non-English names correctly in=20
> source files.=20

The only foreign language that's relevant in the context of this=20
particular comment is C. Writing '0' to indicate a char value would be=20
fine but this is not a char value.

Quoted and unquoted zeros are used inconsistently in this comment, though=
=20
the patch does not address this unfortunately.

> I don't think it's feasible nor desirable to eliminate all non-ASCII=20
> UTF-8 from kernel source code files.

That's neither here nor there -- I don't think it's feasible or desirable=
=20
to eliminate all bugs from the kernel source code files. One man's bug is=
=20
another man's feature e.g. bloat, choice of programming language,=20
interpretation of license terms.

> Maybe this means that it's time to switch to another editor?
>=20

It's not hard to find more tooling that is impacted by misplaced unicode.=
=20
The security vulnerabilities stemming from the use of Unicode in source=20
files are telling.

Unicode doesn't help here so it shouldn't have been used here IMO.
---1463811774-132907978-1658795837=:30080--

