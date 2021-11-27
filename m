Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62441C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Nov 2021 02:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPCc9FUte8/0uYNuYOczwzGN+z9/gyAcJ5i/dnjcHuA=; b=SI8Zl+86ohtCrh
	KiilghZXNZDFEusy0lvrclsNcwJ91rQFbDRP6KnYoYxFnIAemM/KnLxSEHlx3rD0R84ZPVndrZ4+8
	VBdcOGWs7aJiO/dI8VuhrDqSTlO5w2HIaZDo4EX1hm3O6jv16+H2KrR7+03bC7xxIFeCwj74vAw2Y
	zy7RA7KGcg3wQYEgqpLVWXfM5YCsyV2Vsngfj1fmX0SRzah/YCYx+C2LlKFJ5w/pBlG8nQpKb51H2
	CTDzGxAvowJTyDwfPyW/JIH8w7oKMDNMukMuF1Q/TocAWdVvqltIsn+G+fWttut7OMad/MvNxBvjm
	CErs/VwKzgVjFheSip7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqnVj-00CfjX-CA; Sat, 27 Nov 2021 02:32:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmXK-00CFdZ-JM; Sat, 27 Nov 2021 01:29:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56D59B829B7;
 Sat, 27 Nov 2021 01:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B005C53FC1;
 Sat, 27 Nov 2021 01:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637976590;
 bh=XJhSZlLuBETGQP56bfuntv9zCxe4SskI6kt8Sv9zIz4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GwxpOKUBOO74xMaGt/gvl4xWEfi8AEIsd4DBNQ1e2sFoTmFzprNsXZzE9t7+cJGoY
 kyq05Eew08WhVnE33IpSraXD2OjMZPL8YL066elgXldvyV/8x05yIsL1GUj7oCSvnk
 YfwOSl+mqhJPvHeco6gVG1GqK06s5PVAnHMX1HzvI8Fwlpjw+vc9hYBlRooOS22BqX
 LHzd3Jbm95KGZ2FxkCjPRy10uFhzFGa8WUT+eREkIGK2/+qFntpNmPk/6+OxuM8D+1
 xPipAkCNym9G2wHVIguMrNu7yGhZvNrmD5xxDI8mcZjx7w0Lz6mYUMTpWYojngPXpl
 0HwlBoTc9PS4w==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, YC Hung <yc.hung@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20211123103013.73645-1-geert@linux-m68k.org>
References: <20211123103013.73645-1-geert@linux-m68k.org>
Subject: Re: [PATCH] ASoC: SOF: mediatek: Use %pR/%pa to print
 resources/physical addresses
Message-Id: <163797658773.2987942.13053830278646799334.b4-ty@kernel.org>
Date: Sat, 27 Nov 2021 01:29:47 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_172954_998009_02ACDB56 
X-CRM114-Status: GOOD (  13.45  )
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

T24gVHVlLCAyMyBOb3YgMjAyMSAxMTozMDoxMyArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOgo+IE9uIDMyLWJpdCB3aXRoIENPTkZJR19BUkNIX0RNQV9BRERSX1RfNjRCSVQ9bjoKPiAK
PiAgICAgc291bmQvc29jL3NvZi9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LmM6IEluIGZ1bmN0aW9u
IOKAmHBsYXRmb3JtX3BhcnNlX3Jlc291cmNl4oCZOgo+ICAgICBzb3VuZC9zb2Mvc29mL21lZGlh
dGVrL210ODE5NS9tdDgxOTUuYzo1MToxNTogZXJyb3I6IGZvcm1hdCDigJglbGx44oCZIGV4cGVj
dHMgYXJndW1lbnQgb2YgdHlwZSDigJhsb25nIGxvbmcgdW5zaWduZWQgaW504oCZLCBidXQgYXJn
dW1lbnQgNCBoYXMgdHlwZSDigJh1bnNpZ25lZCBpbnTigJkgWy1XZXJyb3I9Zm9ybWF0PV0KPiAg
ICAgICAgNTEgfCAgZGV2X2RiZyhkZXYsICJETUEgcGJhc2U9MHglbGx4LCBzaXplPTB4JWxseFxu
IiwKPiAJICB8ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
Cj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8KCiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2Jyb29uaWUvc291bmQuZ2l0IGZvci1uZXh0CgpUaGFua3MhCgpb
MS8xXSBBU29DOiBTT0Y6IG1lZGlhdGVrOiBVc2UgJXBSLyVwYSB0byBwcmludCByZXNvdXJjZXMv
cGh5c2ljYWwgYWRkcmVzc2VzCiAgICAgIGNvbW1pdDogNGRjZGRhZGY1NTMwYTBkYTAwZTZiMmVi
ODE5NDI5N2I0OWQzMzUwNgoKQWxsIGJlaW5nIHdlbGwgdGhpcyBtZWFucyB0aGF0IGl0IHdpbGwg
YmUgaW50ZWdyYXRlZCBpbnRvIHRoZSBsaW51eC1uZXh0CnRyZWUgKHVzdWFsbHkgc29tZXRpbWUg
aW4gdGhlIG5leHQgMjQgaG91cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1cmluZwp0aGUgbmV4dCBt
ZXJnZSB3aW5kb3cgKG9yIHNvb25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgpLCBob3dldmVyIGlmCnBy
b2JsZW1zIGFyZSBkaXNjb3ZlcmVkIHRoZW4gdGhlIHBhdGNoIG1heSBiZSBkcm9wcGVkIG9yIHJl
dmVydGVkLgoKWW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJlc3VsdGluZyBmcm9tIGF1dG9t
YXRlZCBvciBtYW51YWwgdGVzdGluZwphbmQgcmV2aWV3IG9mIHRoZSB0cmVlLCBwbGVhc2UgZW5n
YWdlIHdpdGggcGVvcGxlIHJlcG9ydGluZyBwcm9ibGVtcyBhbmQKc2VuZCBmb2xsb3d1cCBwYXRj
aGVzIGFkZHJlc3NpbmcgYW55IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRlZCBpZiBuZWVkZWQuCgpJ
ZiBhbnkgdXBkYXRlcyBhcmUgcmVxdWlyZWQgb3IgeW91IGFyZSBzdWJtaXR0aW5nIGZ1cnRoZXIg
Y2hhbmdlcyB0aGV5CnNob3VsZCBiZSBzZW50IGFzIGluY3JlbWVudGFsIHVwZGF0ZXMgYWdhaW5z
dCBjdXJyZW50IGdpdCwgZXhpc3RpbmcKcGF0Y2hlcyB3aWxsIG5vdCBiZSByZXBsYWNlZC4KClBs
ZWFzZSBhZGQgYW55IHJlbGV2YW50IGxpc3RzIGFuZCBtYWludGFpbmVycyB0byB0aGUgQ0NzIHdo
ZW4gcmVwbHlpbmcKdG8gdGhpcyBtYWlsLgoKVGhhbmtzLApNYXJrCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
