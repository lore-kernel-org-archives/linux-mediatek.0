Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC523C982E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 14:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gn+BmxhD/JNcuU4fD1WWhF+MIRk2TooarfAtYG79tHg=; b=Ja6lrRiwJ+IkfAFJr33kmNdtn7
	+i55uAd8+4nCPabxl5KyJqOclTRvI+MwgPkKrzKDzdq6S6EbS1GKtxRsV1Qc+RcVUTvMt+iJ/WcqI
	66od9Du6jfs+S/Q/Cwc0SI+6nmFA3YZTa3qr3/aD8Ucboyu7c39PvRlNGyDzyVeAfow4SrxijWU3q
	fMfOxaO/UOOuS5VoLUYx8D8krbZc3FGDNvl/5gKohXF8VESAR2W2r0NFnqJianf1cSoKqkvMdTypP
	bFFjRaFRz4MELrIHlUQQMFOnIv/EIJL4p41FqMd9i+JGrGs/FIepvK0XvFUk2wmkUvrPlYYakkmTb
	OVvzoA5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ehY-00000002Lnn-0od3;
	Mon, 21 Sep 2026 14:09:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ehV-00000002Lmd-1giE;
	Mon, 21 Sep 2026 14:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Gn+BmxhD/JNcuU4fD1WWhF+MIRk2TooarfAtYG79tHg=; b=Jo9PGfv6sUL3AVd4DQxzuxDsIx
	UzdU5dXMg6WF9h+i6lmKlcBkqaTdDhfJdU5uwWvaAuWtWCqsddJ35BA/8e1caGfwi4/uAdnEqBk0k
	W6/QFYQcXULz2MNkKVBVT92y7ZUgDlLrhF69I0D8jZamnhbBhT460zWtFw81vtn5vBoSvm5zv8bxs
	ZFEM8IENUU23h3ychCw8LNqErZ/kqXw3/XuJ+RipE0U1D/DGB8Y6Wye+TN06+e0FKKubMarL1/xYi
	HkOCsbiom+GSPJdvqSbPai14kPf5zcHIM2gVVdUo3zzosTcONKyC5f9XhAiEUFnru8oIIa9C1pRyk
	zzC8iEEA==;
Received: from smtprelay0014.hostedemail.com ([216.40.44.14] helo=relay.hostedemail.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8ehP-0000000CNz9-3NVE;
	Mon, 21 Sep 2026 14:08:55 +0000
Received: from omf03.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id B11CCA01AC;
	Mon, 21 Sep 2026 14:08:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id 911BC60012;
	Mon, 21 Sep 2026 14:08:42 +0000 (UTC)
Date: Mon, 21 Sep 2026 10:08:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>, paulmck@kernel.org, Chunfeng
 Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <20260921100840.06ed9a5c@fedora>
In-Reply-To: <arE4jcn4dCD9gos_@J2N7QTR9R3.cambridge.arm.com>
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
	<d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
	<b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
	<aae79c1c-8738-4b97-b1b9-d82d19d82d49@arm.com>
	<20260909093524.249c2a1a@gandalf.local.home>
	<arE4jcn4dCD9gos_@J2N7QTR9R3.cambridge.arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 911BC60012
X-Stat-Signature: 114cow448kn3jskn8mcbahpqgk5q1zjp
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+6iX7aw+AEdsz8I3D5gPEpnh6FMY2CMew=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=Gn+BmxhD/JNcuU4fD1WWhF+MIRk2TooarfAtYG79tHg=; b=DukIcoa6v7phdTMf6m5UVnW7+KyYEKz1hd5/etXi3bA7DJLpluAbt6f1C5jOCeFSIjn5wvc0+NRD4n83WHv98TUeHkYEybnxFaA4Ldzz60o+hYaxcFBBgLqKHiUHgALA59/muXLwTKcI6zbqsSj0UIXoP+EMlwbWH1rq4ZM/QEo=
X-HE-Tag: 1789999722-481411
X-HE-Meta: U2FsdGVkX19/UFDGGX0R7hJOl0eqhLN4z3Xyqo57qVxjhBGGJ8+irxELNoUvgRrhav0zZUuXGG6f0hqs0Ec7fzx6Gi8T20QLjXTE4R15eMV4KCrkB+iohyXm7j5VxMQkMDRRnfGvGp/Kvy34UHyyCB2LzmPCfltK5x+BV2rAu6eCUaH4u1iepzldFqm3aFvdwkeIUJli7LjN05X9JigVskE8QEKtl0Y7dHRvbldbJVrKNQKCacDAnGNXFgqX+BidWR5uBi1tjIBduCi9B9spQk+I7UD/BEKN8kZMeL65eYXlxOnc7xBSrQTKR59gsDt2GLpKhbYLevRkIbFTiih/WexqbJnkE0iN+/Sk99u2kq1M1hN2FFn7vLLnv6zadATPKFfFReoWhxgIMSCH+sjOsg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_150853_315930_A6239422 
X-CRM114-Status: UNSURE (   6.07  )
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

On Mon, 21 Sep 2026 15:00:45 +0100
Mark Rutland <mark.rutland@arm.com> wrote:

> Steve, I assume you were expecting someone to send the above as a full
> patch.

Yes.

-- Steve

