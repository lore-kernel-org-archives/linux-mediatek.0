Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE637F47CD0
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 21:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yx4pFGq+U2fz4UG6x4F5rdwJg0eTjQaePUmLPxRD42g=; b=pG36D7TOGEroWuMz6SGuLU3/qZ
	quwm+b7QwndOO0JPVuFeewrHHTrThqP2Wg4PifQzMmG5R8GCBlzRjPnLbcZMjOhyMZKdzGACUJXGs
	Giq6XkL24O/qB2JxPltYqQ0YVUsTbkWimR6KK2M/yBmfMbe00W+fKeQFek0rM41K3yAydjHhlCtiV
	ubFpZuPxPK5xZocfzlQj5CSv6AEGN7pKg4P4oReWoi00exGf6pMCmQoi+in5yBUn5xNFHTm6VW/Og
	W5HmWNgbXgje0a3E32oenQ+jQuZOelAi+EhWJa+Uyv3URQHQT9XXnkvsV2KAOhqiMUStDjdux7X8r
	VP54Uy0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFqz-00000002YGW-2Xop;
	Thu, 05 Mar 2026 21:03:29 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFqw-00000002YG0-2zWs;
	Thu, 05 Mar 2026 21:03:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772744598; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XLB+plORjjwdonK5xvMsENRrqBB53SzB5cMQHIBO7lEjFuTDaSHxmIWdtg+Ao1Obh4
    iKZJNBprdYEAIZTT0tfSu96/m5PY8zPsm3hErv44Rf3LFnNWQGsrGHy5Q2FboNlgk9Kf
    Wp/xOw/PwL9BDVqqoQF7sQgk5kP4Iw+8nrB6hx08P3Car1P3W7jqssJw0ia276FKHvLr
    6/1jO1qrGUjQz3DwZ0CLMF0mmKhZINqdUmtkGCBnc6FSNVqqMb4K93S03+vcdinmxmvA
    oK2ZQQ570YZmSk3+hT4B5j0alYggMH0ThrVNu0sc9cqoA1mPnq4I9iJkDCEclsL780AM
    F13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1772744598;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=Yx4pFGq+U2fz4UG6x4F5rdwJg0eTjQaePUmLPxRD42g=;
    b=p6aD7dW21DxwngeXqNWYWK8OdEa6zPFWiAqhJWMuaM8GtElpPyECJRed5Lxm3nnoun
    oWDhbr9UZb1FYCnYg3UpWJGd4QLN0EJuDlELwIQszR4lIMHQWiXhgcQQu+ZsUPaiPvF1
    IMoQnRwa4UvtkcFxCHpfcjX14MXdvYZ6HUhIYcR5Lyk+ry0zRLlMkuWC/UKFikl5sQ3q
    +TOvBVtW0Ohor5aRYyRWUPKewm5Fhz3NTSnZyDNDxa5rPZOPdPh3DlYBdfiq0Wm+ScL1
    PTPWl+ewLIc213d6O1DeJgH3OO4n9oLdvSA0/4HyXT3yV1MCGf5VYphsdYQ/yPeL5o0Z
    R1rA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1772744598;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=Yx4pFGq+U2fz4UG6x4F5rdwJg0eTjQaePUmLPxRD42g=;
    b=epPf6aRM0co0gjVfIz63J+hgTBgdg76E+9k0wrJqzS/2hoKpLyaxjd59UVifC0w3S2
    gVkIPfSjdDYlvQ35H4bgbnun+Y0woiNlwQe1H4u8nJK+S4BmU2ipTrAD9NiFc9W5xXkv
    9yzmjT6TDXrBGqlEebr0A84R4+puSyl/V4C8BmhFrxz/d1CiY5IoNYiITmZ8WjtGJZRk
    Bl5+R+IOlQDGiq3PJTeJgFF75pQDtFUHVDb6DbHe7aw5L4saI+q5XAcq48U8Wbq7Rq1J
    IJBo/mopmtDl/sYlTp3rttgcTXfR2siU7Idj3mEtEEq7h8OEx/fRxPXZkrFD/rhH+AwO
    nzQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1772744598;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=Yx4pFGq+U2fz4UG6x4F5rdwJg0eTjQaePUmLPxRD42g=;
    b=QEnaNmvEE1Gz2soV99MDcdGfrKTxP4eGMNq1bUdwgstKdqcJWgGHKB5lQ4SBEqXrBR
    rajzeivLC4sZqqBg8LBw==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0zNriHg+YfT0rGSTpN/lG4EkH1OcwzJ11G3m+XGf4kwpD3TrkAw="
Received: from p200300c58703fb9bfc647aebea4a424d.dip0.t-ipconnect.de
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z79345225L3G7LL
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 5 Mar 2026 22:03:16 +0100 (CET)
Message-ID: <15d49cfb52990dea46596c2eb0cbdc7db9c44ab1.camel@iokpp.de>
Subject: Re: [PATCH v2 01/11] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
From: Bean Huo <beanhuo@iokpp.de>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Sai Krishna
 Potthuri <sai.krishna.potthuri@amd.com>, Ajay Neeli <ajay.neeli@amd.com>,
 Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Peter Wang <peter.wang@mediatek.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang
 <zhang.lyra@gmail.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,  "Bao
 D. Nguyen" <quic_nguyenb@quicinc.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Archana Patni <archana.patni@intel.com>, open
 list <linux-kernel@vger.kernel.org>, "open list:UNIVERSAL FLASH STORAGE
 HOST CONTROLLER DRIVER..." <linux-samsung-soc@vger.kernel.org>, "moderated
 list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:UNIVERSAL FLASH
 STORAGE HOST CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
Date: Thu, 05 Mar 2026 22:03:16 +0100
In-Reply-To: <20260304135313.413688-2-can.guo@oss.qualcomm.com>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
	 <20260304135313.413688-2-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_130327_014120_B9493D04 
X-CRM114-Status: UNSURE (   9.34  )
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

T24gV2VkLCAyMDI2LTAzLTA0IGF0IDA1OjUzIC0wODAwLCBDYW4gR3VvIHdyb3RlOgo+IEBAIC00
NzQ3LDYgKzQ3NDUsMjIgQEAgc3RhdGljIGludCB1ZnNoY2RfY2hhbmdlX3Bvd2VyX21vZGUoc3Ry
dWN0IHVmc19oYmEKPiAqaGJhLAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+IMKgfQo+
IMKgCj4gK2ludCB1ZnNoY2RfY2hhbmdlX3Bvd2VyX21vZGUoc3RydWN0IHVmc19oYmEgKmhiYSwK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCB1ZnNfcGFfbGF5ZXJfYXR0ciAqcHdyX21vZGUpCj4gK3sKPiArwqDCoMKgwqDCoMKg
wqBpbnQgcmV0Owo+ICsKPiArwqDCoMKgwqDCoMKgwqB1ZnNoY2Rfdm9wc19wd3JfY2hhbmdlX25v
dGlmeShoYmEsIFBSRV9DSEFOR0UsIHB3cl9tb2RlKTsKCgp1ZnNoY2RfY2hhbmdlX3Bvd2VyX21v
ZGUoKSBjYWxscyBwd3JfY2hhbmdlX25vdGlmeShQUkVfQ0hBTkdFKSBidXQgaWdub3JlcyBpdHMK
cmV0dXJuLCB0aGlzIGNhbiBjb250aW51ZSB3aXRoIGludmFsaWQgdmVuZG9yIHByZXA/IEkgc2F3
IHRoZXJlIGlzIGNoZWNrdXAKYmVmb3JlLCBkbyB5b3UgdGhpbmsgYWRkaW5nIGNoZWNrIHJlc3Vs
dD8KCj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHVmc2hjZF9kbWVfY2hhbmdlX3Bvd2VyX21v
ZGUoaGJhLCBwd3JfbW9kZSk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlmICghcmV0KQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1ZnNoY2Rfdm9wc19wd3JfY2hhbmdlX25vdGlmeSho
YmEsIFBPU1RfQ0hBTkdFLCBwd3JfbW9kZSk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBy
ZXQ7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwodWZzaGNkX2NoYW5nZV9wb3dlcl9tb2RlKTsK
CgpLaW5kIHJlZ2FyZHMsCkJlYW4K


