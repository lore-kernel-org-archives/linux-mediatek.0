Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67039C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhUsl0QJSE7TcMW53RMR1w5JWw2BIew20qj/QmyP2gI=; b=xHz3v5z8T1zEYr
	7nKCSJnJbgRiaoODkQh5AZvBkLGoJUEBP/iXVx9dJQpIV5jSOWAqsK1aF3RWy6OjAS3ebdFAq/a38
	bhWdXCHx10O2a9ICFtTTaV0ox2Iq01p5uHKUmUcaGDGgocvPR6EZ1jLKu6VIzPcNs5QknozIFTCNr
	3eHRpz3Gytp3UDLtvxFumFwOF2ZOIM+DpjH461G1duxgCWrJ/YW8sQcI8Xz/5nJxg72JWer1eJM5D
	+7WduAhgN1bPH+E4Wa0YBnd87nMXPO8Vo+itxnh7yUGbI6dvFJTXA65sZOchqG8/C6OdHzlLmoGA6
	5ih4pUkJxiC0ZMwPCzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIISk-00586Q-BZ; Thu, 10 Feb 2022 23:02:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIISY-00583h-K0; Thu, 10 Feb 2022 23:02:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9828861D4F;
 Thu, 10 Feb 2022 23:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103CDC340F0;
 Thu, 10 Feb 2022 23:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644534161;
 bh=dWlM6GzodJ6qB1EODWTpq+ewUBIgSf03yMrzLU0NHO8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=R4M3aM2dbBiCBVRD9SOPozc/V4OMcqIhnAKKSnSRve3J2dFrqxI5l0sj8LlB32DK1
 /e6iIKXE6/IG2p4Su/Od36qjzmpJA5SYpwfysVYa7gR3d8L15MH6CKyLYX9l47EW5Z
 dONy7oE4u4OBzkPH6o7ZV1r0SJoKUSqCSWQHwXe+ib0eVkq9SI5PF19U3l918OOA/m
 88H8jhZkAX9rjjrRGN9geqpzcuCmOKATJ9jR9hwjktaJo1AYeel6jsTuFzSx/hnKLQ
 rmKEsY6fZTyHKfbMJdVL5IWtQrvEfpvJDzOxE9oLAJTFROsWR8bFOd1lZeRGsskvt0
 2cSzyvrvcO+aQ==
Received: by mail-ej1-f49.google.com with SMTP id k25so18858037ejp.5;
 Thu, 10 Feb 2022 15:02:40 -0800 (PST)
X-Gm-Message-State: AOAM533DLiHbc0YiIzhaYXmxRgJHd+bqhEsWjFIlQIr80aXD7a3Tk+XV
 RjSfWC3KpkMFOlmeyO6SDPqhDYrNwXVu253IaQ==
X-Google-Smtp-Source: ABdhPJz2bSTC3EJpr7pbff7mvYDGZyI2Hfx9d+xyM27F2vwC06Lxziyew4yTIc/KsKfPOLtMgnGB5JXbzuRSDEEER68=
X-Received: by 2002:a17:906:c10f:: with SMTP id
 do15mr8161642ejc.638.1644534159327; 
 Thu, 10 Feb 2022 15:02:39 -0800 (PST)
MIME-Version: 1.0
References: <20210915232722.10031-1-chunkuang.hu@kernel.org>
 <CAAOTY_8BZ9BgWeQVsD_01ioP8H16c1_QUb_+yniU_4Wp91Nc7A@mail.gmail.com>
 <b233115c-704a-df4c-9d75-70cebb80a53c@gmail.com>
In-Reply-To: <b233115c-704a-df4c-9d75-70cebb80a53c@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 11 Feb 2022 07:02:26 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9zMfd1inE_4Lo=p3tM7Wq3NerOaDnpksdU811mfm=_4w@mail.gmail.com>
Message-ID: <CAAOTY_9zMfd1inE_4Lo=p3tM7Wq3NerOaDnpksdU811mfm=_4w@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: cmdq: Use mailbox rx_callback instead of
 cmdq_task_cb
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, 
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_150242_779828_D93A56AC 
X-CRM114-Status: GOOD (  27.06  )
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

SGksIE1hdHRoaWFzOgoKTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g
5pa8IDIwMjHlubQxMOaciDjml6Ug6YCx5LqUIOS4i+WNiDEwOjMw5a+r6YGT77yaCj4KPiBIaSBD
aHVuLUt1YW5nLAo+Cj4gT24gMDgvMTAvMjAyMSAxNjoxNSwgQ2h1bi1LdWFuZyBIdSB3cm90ZToK
PiA+IEhpLCBNYXR0aGlhczoKPiA+Cj4gPiBQbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2ggYmVjYXVz
ZSB0aGlzIHBhdGNoIGRlcGVuZCBvbiBbMV0gd2hpY2ggd291bGQKPiA+IGNhdXNlIG51bWVyb3Vz
IHdhcm5pbmcgbWVzc2FnZS4gU28gSSB3b3VsZCByZXZlcnQgdGhhdCBwYXRjaCBpbiBbMl0uCj4g
Pgo+Cj4gVGhhbmtzIGZvciB0aGUgaGVhZC11cHMuIEknbGwgaWdub3JlIHRoaXMgcGF0Y2guCgpU
aGlzIHBhdGNoIGRlcGVuZCBvbiBbM10gd2hpY2ggaGFzIGJlZW4gbWVyZ2VkIGludG8gbWFpbmxp
bmUsIHNvIHlvdQpjb3VsZCAgc3RhcnQgdG8gcmV2aWV3IHRoaXMgcGFyY2guCgpbM10gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXgu
Z2l0L2NvbW1pdC9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWs/aD12NS4xNy1yYzMmaWQ9MWVlMDdh
NjgzYjdlNGU2YWQ5YWQ0Zjc3ZmNlNDc1MTc0MWJjOGNlYgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4K
Cj4KPiBSZWdhcmRzLAo+IE1hdHRoaWFzCj4KPiA+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0L2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlaz9oPXY1LjE1LXJjNCZpZD1jMWVjNTRiN2I1YWYyNWM3NzkxOTIy
NTNmNWE5ZjA1ZTk1Y2I0M2Q3Cj4gPiBbMl0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjExMDA3MjM1MzEwLjE0NjI2LTYtY2h1bmt1
YW5nLmh1QGtlcm5lbC5vcmcvCj4gPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+
ID4gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0Oeac
iDE25pelIOmAseWbmyDkuIrljYg3OjI35a+r6YGT77yaCj4gPj4KPiA+PiByeF9jYWxsYmFjayBp
cyBhIHN0YW5kYXJkIG1haWxib3ggY2FsbGJhY2sgbWVjaGFuaXNtIGFuZCBjb3VsZCBjb3ZlciB0
aGUKPiA+PiBmdW5jdGlvbiBvZiBwcm9wcmlldGFyeSBjbWRxX3Rhc2tfY2IsIHNvIHVzZSB0aGUg
c3RhbmRhcmQgb25lIGluc3RlYWQgb2YKPiA+PiB0aGUgcHJvcHJpZXRhcnkgb25lLiBDbGllbnQg
aGFzIGNoYW5nZWQgdG8gdXNlIHRoZSBzdGFuZGFyZCBjYWxsYmFjawo+ID4+IG1hY2hhbmlzbSBh
bmQgc3luYyBkbWEgYnVmZmVyIGluIGNsaWVudCBkcml2ZXIsIHNvIHJlbW92ZSB0aGUgcHJvcHJp
ZXRhcnkKPiA+PiBjYWxsYmFjayBpbiBjbWRxIGhlbHBlci4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYt
Ynk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ID4+IC0tLQo+ID4+
ICAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMgfCAyNSArLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gPj4gICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21k
cS5oICB8ICA1ICstLS0tCj4gPj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MjggZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0
ZWsvbXRrLWNtZHEtaGVscGVyLmMgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxw
ZXIuYwo+ID4+IGluZGV4IDNjOGU0MjEyZDk0MS4uYzE4MzdhNDY4MjY3IDEwMDY0NAo+ID4+IC0t
LSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jCj4gPj4gKysrIGIvZHJp
dmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMKPiA+PiBAQCAtNDI1LDM0ICs0MjUs
MTEgQEAgaW50IGNtZHFfcGt0X2ZpbmFsaXplKHN0cnVjdCBjbWRxX3BrdCAqcGt0KQo+ID4+ICAg
fQo+ID4+ICAgRVhQT1JUX1NZTUJPTChjbWRxX3BrdF9maW5hbGl6ZSk7Cj4gPj4KPiA+PiAtc3Rh
dGljIHZvaWQgY21kcV9wa3RfZmx1c2hfYXN5bmNfY2Ioc3RydWN0IGNtZHFfY2JfZGF0YSBkYXRh
KQo+ID4+IC17Cj4gPj4gLSAgICAgICBzdHJ1Y3QgY21kcV9wa3QgKnBrdCA9IChzdHJ1Y3QgY21k
cV9wa3QgKilkYXRhLmRhdGE7Cj4gPj4gLSAgICAgICBzdHJ1Y3QgY21kcV90YXNrX2NiICpjYiA9
ICZwa3QtPmNiOwo+ID4+IC0gICAgICAgc3RydWN0IGNtZHFfY2xpZW50ICpjbGllbnQgPSAoc3Ry
dWN0IGNtZHFfY2xpZW50ICopcGt0LT5jbDsKPiA+PiAtCj4gPj4gLSAgICAgICBkbWFfc3luY19z
aW5nbGVfZm9yX2NwdShjbGllbnQtPmNoYW4tPm1ib3gtPmRldiwgcGt0LT5wYV9iYXNlLAo+ID4+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGt0LT5jbWRfYnVmX3NpemUsIERNQV9U
T19ERVZJQ0UpOwo+ID4+IC0gICAgICAgaWYgKGNiLT5jYikgewo+ID4+IC0gICAgICAgICAgICAg
ICBkYXRhLmRhdGEgPSBjYi0+ZGF0YTsKPiA+PiAtICAgICAgICAgICAgICAgY2ItPmNiKGRhdGEp
Owo+ID4+IC0gICAgICAgfQo+ID4+IC19Cj4gPj4gLQo+ID4+IC1pbnQgY21kcV9wa3RfZmx1c2hf
YXN5bmMoc3RydWN0IGNtZHFfcGt0ICpwa3QsIGNtZHFfYXN5bmNfZmx1c2hfY2IgY2IsCj4gPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpCj4gPj4gK2ludCBjbWRxX3BrdF9m
bHVzaF9hc3luYyhzdHJ1Y3QgY21kcV9wa3QgKnBrdCkKPiA+PiAgIHsKPiA+PiAgICAgICAgICBp
bnQgZXJyOwo+ID4+ICAgICAgICAgIHN0cnVjdCBjbWRxX2NsaWVudCAqY2xpZW50ID0gKHN0cnVj
dCBjbWRxX2NsaWVudCAqKXBrdC0+Y2w7Cj4gPj4KPiA+PiAtICAgICAgIHBrdC0+Y2IuY2IgPSBj
YjsKPiA+PiAtICAgICAgIHBrdC0+Y2IuZGF0YSA9IGRhdGE7Cj4gPj4gLSAgICAgICBwa3QtPmFz
eW5jX2NiLmNiID0gY21kcV9wa3RfZmx1c2hfYXN5bmNfY2I7Cj4gPj4gLSAgICAgICBwa3QtPmFz
eW5jX2NiLmRhdGEgPSBwa3Q7Cj4gPj4gLQo+ID4+IC0gICAgICAgZG1hX3N5bmNfc2luZ2xlX2Zv
cl9kZXZpY2UoY2xpZW50LT5jaGFuLT5tYm94LT5kZXYsIHBrdC0+cGFfYmFzZSwKPiA+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBrdC0+Y21kX2J1Zl9zaXplLCBETUFfVE9f
REVWSUNFKTsKPiA+PiAtCj4gPj4gICAgICAgICAgZXJyID0gbWJveF9zZW5kX21lc3NhZ2UoY2xp
ZW50LT5jaGFuLCBwa3QpOwo+ID4+ICAgICAgICAgIGlmIChlcnIgPCAwKQo+ID4+ICAgICAgICAg
ICAgICAgICAgcmV0dXJuIGVycjsKPiA+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zb2Mv
bWVkaWF0ZWsvbXRrLWNtZHEuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRx
LmgKPiA+PiBpbmRleCBhYzZiNWYzY2JhOTUuLjJiNDk4ZjRmMzk0NiAxMDA2NDQKPiA+PiAtLS0g
YS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oCj4gPj4gKysrIGIvaW5jbHVk
ZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaAo+ID4+IEBAIC0yNjgsOCArMjY4LDYgQEAg
aW50IGNtZHFfcGt0X2ZpbmFsaXplKHN0cnVjdCBjbWRxX3BrdCAqcGt0KTsKPiA+PiAgICAqIGNt
ZHFfcGt0X2ZsdXNoX2FzeW5jKCkgLSB0cmlnZ2VyIENNRFEgdG8gYXN5bmNocm9ub3VzbHkgZXhl
Y3V0ZSB0aGUgQ01EUQo+ID4+ICAgICogICAgICAgICAgICAgICAgICAgICAgICAgIHBhY2tldCBh
bmQgY2FsbCBiYWNrIGF0IHRoZSBlbmQgb2YgZG9uZSBwYWNrZXQKPiA+PiAgICAqIEBwa3Q6ICAg
ICAgIHRoZSBDTURRIHBhY2tldAo+ID4+IC0gKiBAY2I6ICAgICAgICAgICAgICAgIGNhbGxlZCBh
dCB0aGUgZW5kIG9mIGRvbmUgcGFja2V0Cj4gPj4gLSAqIEBkYXRhOiAgICAgIHRoaXMgZGF0YSB3
aWxsIHBhc3MgYmFjayB0byBjYgo+ID4+ICAgICoKPiA+PiAgICAqIFJldHVybjogMCBmb3Igc3Vj
Y2VzczsgZWxzZSB0aGUgZXJyb3IgY29kZSBpcyByZXR1cm5lZAo+ID4+ICAgICoKPiA+PiBAQCAt
Mjc3LDcgKzI3NSw2IEBAIGludCBjbWRxX3BrdF9maW5hbGl6ZShzdHJ1Y3QgY21kcV9wa3QgKnBr
dCk7Cj4gPj4gICAgKiBhdCB0aGUgZW5kIG9mIGRvbmUgcGFja2V0LiBOb3RlIHRoYXQgdGhpcyBp
cyBhbiBBU1lOQyBmdW5jdGlvbi4gV2hlbiB0aGUKPiA+PiAgICAqIGZ1bmN0aW9uIHJldHVybmVk
LCBpdCBtYXkgb3IgbWF5IG5vdCBiZSBmaW5pc2hlZC4KPiA+PiAgICAqLwo+ID4+IC1pbnQgY21k
cV9wa3RfZmx1c2hfYXN5bmMoc3RydWN0IGNtZHFfcGt0ICpwa3QsIGNtZHFfYXN5bmNfZmx1c2hf
Y2IgY2IsCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpOwo+ID4+ICtp
bnQgY21kcV9wa3RfZmx1c2hfYXN5bmMoc3RydWN0IGNtZHFfcGt0ICpwa3QpOwo+ID4+Cj4gPj4g
ICAjZW5kaWYgLyogX19NVEtfQ01EUV9IX18gKi8KPiA+PiAtLQo+ID4+IDIuMjUuMQo+ID4+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
