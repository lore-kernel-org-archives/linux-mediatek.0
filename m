Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE0CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 09:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HKpJffsfX5TOKJ40soIaz8jvy6qM81osKUt4Ak9Mmpw=; b=Y6kCiQ23MlUcnk
	SN1bEiAreBvwSanzIq0hxXMBw7KA/69Pb9szniKJbRhcIdgoerhAaoIAE1ElMXH01gAnS8N2q1XrE
	26E80FB8nRDQBa/WMx+yhqOXOr7q/hEUXquhDNnrDa1AC9O1g8/djR72kbhKgDkVOZd9xM7LjwIIx
	tG4yHxSs8q1f86gaoJKZYua+IVgDURecetGYcNMvXizC4zL8t6T5lj6s/FooZ3ugyFFFTbxPDQnyN
	7EohlAcNOP6Xu4y2HNWMC8IlYazVz+Kh6N9qxa7DgZEJroLWz+ZWU55+i4EeOsY2dREOLH8AOCCV8
	fEhPao9BXRvqIE+HCiYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBvF1-002idA-GU; Mon, 24 Jan 2022 09:02:23 +0000
Received: from mail.portyid.pl ([192.36.61.58])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBvEp-002iWv-Lk
 for linux-mediatek@lists.infradead.org; Mon, 24 Jan 2022 09:02:13 +0000
Received: by mail.portyid.pl (Postfix, from userid 1001)
 id 5CA7A4124A; Mon, 24 Jan 2022 10:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=portyid.pl; s=mail;
 t=1643014906; bh=+PMi7irkA4XlRgpdW2HqpqcJeZNxKGysf407T0katTE=;
 h=Date:From:To:Subject:From;
 b=LNNSuSiCoIDip7r0NAJF0VCiQNhhEG5LRLpNqPVdoiRek/rxdidB9/uh9i/bAjO0/
 PlLwNmEdub9x/cPs+abwFG6rZmxkpWVd4ZaftWUggOs0du8QM7AzgDM1edze0urz1k
 ScQfAbbYELwt8yK+BckxxYEorRVxjvqyNf9vz7PBnGNidlZSpHjyfoeaD59zQsKWw7
 zWbNUbqT4YEagUPKKmbwf/K8CNnnCU5opXc1brnqLE+I4cBHcrCq2YtudXCLWOzr5Q
 66h7KGIPOQ7ksNER6LbYztGlKYTZBrkfp3bV6yYbWIb0aoV6dk2Kcpo+KlJ8X31Yqj
 6aXjSixlv1p8Q==
Received: by mail.portyid.pl for <linux-mediatek@lists.infradead.org>;
 Mon, 24 Jan 2022 09:01:16 GMT
Message-ID: <20220124084500-0.1.1b.5enj.0.pr85wjs35q@portyid.pl>
Date: Mon, 24 Jan 2022 09:01:16 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Jasi=C5=84ski"?= <pawel.jasinski@portyid.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Fotowoltaika - nowe warunki
X-Mailer: mail.portyid.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_010211_974799_9644D3D0 
X-CRM114-Status: UNSURE (   1.77  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKamVzemN6ZSB3IHBpZXJ3c3plaiBwb8WCb3dpZSAyMDIyIHJva3Ugd3py
b3NuxIUgY2VueSB6YSB3eWt1cCBlbmVyZ2lpIGRsYSBwb3NpYWRhY3p5IGZvdG93b2x0YWlraS4g
CgpBYnkgdW5pa27EhcSHIHVtb3d5IG5hIG5vd3ljaCB6YXNhZGFjaCB0cnplYmEgemRlY3lkb3dh
xIcgc2nEmSBuYSBpbnN0YWxhY2rEmSBwYW5lbGkgUFYgZG8ga2/FhGNhIG1hcmNhLiAKCkpha28g
ZmlybWEgc3BlY2phbGl6dWrEhWNhIHNpxJkgdyBtb250YcW8dSBpIHNlcndpc2llIGZvdG93b2x0
YWlraSBjaMSZdG5pZSBwb2Rlam1pZW15IHNpxJkgcmVhbGl6YWNqaSBjYcWCZWdvIHByb2pla3R1
LiBTxIUgUGHFhHN0d28gemFpbnRlcmVzb3dhbmk/CgoKUG96ZHJhd2lhbQpQYXdlxYIgSmFzacWE
c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
