Return-Path: <SRS0=I1M+=LI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14724C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 17:18:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBE6B61241
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 17:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBE6B61241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanyeetech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpU3/xixexTSnNTg8d4aJx3Vc0cOe6Tpq8VXBEvD07A=; b=i88ksdTeGqxvRc
	ZHGWHetHc6eLnQf8brCF20vx+A8UwB8pfqS+ZO8WaiTqNhy7FVK4k4nT/eU/dgZogpNq2eos7+qjN
	QfOSZ/dgVnDMw+DTShvJlIbscomqN8PwN+Bvnyt6a0O0dL47pALWf4Bq90/NdX1tkjIT3vVR24OS0
	O8XAiGBXKQI0BIPbMVzsPR08TrDUB57EJnBPt6+pgnMB8L5DvfsOe80jRIVNV1p1khLTnZHmX0jhc
	MtnZOBLX8225/7jpzpeugzyNL7k61GBZ/JX7inOr2dkfphKp2lrvzq8jeNK0pW4Yn754HGWx2Mrjq
	EKPN1iRDc+lDwYm/XLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsqEJ-00FNxA-R6; Mon, 14 Jun 2021 17:18:31 +0000
Received: from out28-73.mail.aliyun.com ([115.124.28.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsqDq-00FNnL-Uh; Mon, 14 Jun 2021 17:18:04 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.9016092|0.8433917; CH=green;
 DM=|SPAM|false|; DS=CONTINUE|ham_regular_dialog|0.0829513-0.00479038-0.912258;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=21; RT=21; SR=0; TI=SMTPD_---.KSAJpVJ_1623691068; 
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KSAJpVJ_1623691068)
 by smtp.aliyun-inc.com(10.147.41.121);
 Tue, 15 Jun 2021 01:17:58 +0800
From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?=
 <zhouyanjie@wanyeetech.com>
To: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
 sihui.liu@ingenic.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v3 1/2] dt-bindings: dwmac: Add bindings for new Ingenic SoCs.
Date: Tue, 15 Jun 2021 01:15:36 +0800
Message-Id: <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_101803_190765_FE03403E 
X-CRM114-Status: GOOD (  11.16  )
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

QWRkIHRoZSBkd21hYyBiaW5kaW5ncyBmb3IgdGhlIEpaNDc3NSBTb0MsIHRoZSBYMTAwMCBTb0Ms
CnRoZSBYMTYwMCBTb0MsIHRoZSBYMTgzMCBTb0MgYW5kIHRoZSBYMjAwMCBTb0MgZnJvbSBJbmdl
bmljLgoKU2lnbmVkLW9mZi1ieTog5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgPHpob3V5YW5qaWVA
d2FueWVldGVjaC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MS0+djI6CiAgICBObyBjaGFuZ2UuCiAg
ICAKICAgIHYyLT52MzoKICAgIEFkZCAiaW5nZW5pYyxtYWMueWFtbCIgZm9yIEluZ2VuaWMgU29D
cy4KCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvaW5nZW5pYyxtYWMueWFtbCAgICAgICB8
IDc2ICsrKysrKysrKysrKysrKysrKysrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9z
bnBzLGR3bWFjLnlhbWwgICAgICAgIHwgMTUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgOTEgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9uZXQvaW5nZW5pYyxtYWMueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvaW5nZW5pYyxtYWMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvaW5nZW5pYyxtYWMueWFtbApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMC4uNWZlMmU4MQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvaW5nZW5pYyxtYWMueWFtbApAQCAtMCwwICsx
LDc2IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL25ldC9pbmdlbmljLG1hYy55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBCaW5kaW5ncyBmb3IgTUFDIGluIElu
Z2VuaWMgU29DcworCittYWludGFpbmVyczoKKyAgLSDlkajnkLDmnbAgKFpob3UgWWFuamllKSA8
emhvdXlhbmppZUB3YW55ZWV0ZWNoLmNvbT4KKworZGVzY3JpcHRpb246CisgIFRoZSBFdGhlcm5l
dCBNZWRpYSBBY2Nlc3MgQ29udHJvbGxlciBpbiBJbmdlbmljIFNvQ3MuCisKK3Byb3BlcnRpZXM6
CisgIGNvbXBhdGlibGU6CisgICAgZW51bToKKyAgICAgIC0gaW5nZW5pYyxqejQ3NzUtbWFjCisg
ICAgICAtIGluZ2VuaWMseDEwMDAtbWFjCisgICAgICAtIGluZ2VuaWMseDE2MDAtbWFjCisgICAg
ICAtIGluZ2VuaWMseDE4MzAtbWFjCisgICAgICAtIGluZ2VuaWMseDIwMDAtbWFjCisKKyAgcmVn
OgorICAgIG1heEl0ZW1zOiAxCisKKyAgaW50ZXJydXB0czoKKyAgICBtYXhJdGVtczogMQorCisg
IGludGVycnVwdC1uYW1lczoKKyAgICBjb25zdDogbWFjaXJxCisKKyAgY2xvY2tzOgorICAgIG1h
eEl0ZW1zOiAxCisKKyAgY2xvY2stbmFtZXM6CisgICAgY29uc3Q6IHN0bW1hY2V0aAorCisgIG1v
ZGUtcmVnOgorICAgIGRlc2NyaXB0aW9uOiBBbiBleHRyYSBzeXNjb24gcmVnaXN0ZXIgdGhhdCBj
b250cm9sIGV0aGVybmV0IGludGVyZmFjZSBhbmQgdGltaW5nIGRlbGF5CisKKyAgcngtY2xrLWRl
bGF5LXBzOgorICAgIGRlc2NyaXB0aW9uOiBSR01JSSByZWNlaXZlIGNsb2NrIGRlbGF5IGRlZmlu
ZWQgaW4gcGljbyBzZWNvbmRzCisKKyAgdHgtY2xrLWRlbGF5LXBzOgorICAgIGRlc2NyaXB0aW9u
OiBSR01JSSB0cmFuc21pdCBjbG9jayBkZWxheSBkZWZpbmVkIGluIHBpY28gc2Vjb25kcworCity
ZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVnCisgIC0gaW50ZXJydXB0cworICAtIGlu
dGVycnVwdC1uYW1lcworICAtIGNsb2NrcworICAtIGNsb2NrLW5hbWVzCisgIC0gbW9kZS1yZWcK
KworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2sveDEwMDAtY2d1Lmg+CisKKyAgICBtYWM6IGV0aGVy
bmV0QDEzNGIwMDAwIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJpbmdlbmljLHgxMDAwLW1hYyIs
ICJzbnBzLGR3bWFjIjsKKyAgICAgICAgcmVnID0gPDB4MTM0YjAwMDAgMHgyMDAwPjsKKworICAg
ICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZpbnRjPjsKKyAgICAgICAgaW50ZXJydXB0cyA9IDw1
NT47CisgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJtYWNpcnEiOworCisgICAgICAgIGNsb2Nr
cyA9IDwmY2d1IFgxMDAwX0NMS19NQUM+OworICAgICAgICBjbG9jay1uYW1lcyA9ICJzdG1tYWNl
dGgiOworCisgICAgICAgIG1vZGUtcmVnID0gPCZtYWNfcGh5X2N0cmw+OworICAgIH07CisuLi4K
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxk
d21hYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3
bWFjLnlhbWwKaW5kZXggMmVkZDhiZS4uOWMwY2U5MiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKQEAgLTU2LDYgKzU2
LDExIEBAIHByb3BlcnRpZXM6CiAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjhtMi1kd21hYwogICAg
ICAgICAtIGFtbG9naWMsbWVzb24tZ3hiYi1kd21hYwogICAgICAgICAtIGFtbG9naWMsbWVzb24t
YXhnLWR3bWFjCisgICAgICAgIC0gaW5nZW5pYyxqejQ3NzUtbWFjCisgICAgICAgIC0gaW5nZW5p
Yyx4MTAwMC1tYWMKKyAgICAgICAgLSBpbmdlbmljLHgxNjAwLW1hYworICAgICAgICAtIGluZ2Vu
aWMseDE4MzAtbWFjCisgICAgICAgIC0gaW5nZW5pYyx4MjAwMC1tYWMKICAgICAgICAgLSByb2Nr
Y2hpcCxweDMwLWdtYWMKICAgICAgICAgLSByb2NrY2hpcCxyazMxMjgtZ21hYwogICAgICAgICAt
IHJvY2tjaGlwLHJrMzIyOC1nbWFjCkBAIC0zMTAsNiArMzE1LDExIEBAIGFsbE9mOgogICAgICAg
ICAgICAgICAtIGFsbHdpbm5lcixzdW44aS1yNDAtZW1hYwogICAgICAgICAgICAgICAtIGFsbHdp
bm5lcixzdW44aS12M3MtZW1hYwogICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW41MGktYTY0
LWVtYWMKKyAgICAgICAgICAgICAgLSBpbmdlbmljLGp6NDc3NS1tYWMKKyAgICAgICAgICAgICAg
LSBpbmdlbmljLHgxMDAwLW1hYworICAgICAgICAgICAgICAtIGluZ2VuaWMseDE2MDAtbWFjCisg
ICAgICAgICAgICAgIC0gaW5nZW5pYyx4MTgzMC1tYWMKKyAgICAgICAgICAgICAgLSBpbmdlbmlj
LHgyMDAwLW1hYwogICAgICAgICAgICAgICAtIHNucHMsZHd4Z21hYwogICAgICAgICAgICAgICAt
IHNucHMsZHd4Z21hYy0yLjEwCiAgICAgICAgICAgICAgIC0gc3Qsc3BlYXI2MDAtZ21hYwpAQCAt
MzUzLDYgKzM2MywxMSBAQCBhbGxPZjoKICAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuOGkt
cjQwLWVtYWMKICAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuOGktdjNzLWVtYWMKICAgICAg
ICAgICAgICAgLSBhbGx3aW5uZXIsc3VuNTBpLWE2NC1lbWFjCisgICAgICAgICAgICAgIC0gaW5n
ZW5pYyxqejQ3NzUtbWFjCisgICAgICAgICAgICAgIC0gaW5nZW5pYyx4MTAwMC1tYWMKKyAgICAg
ICAgICAgICAgLSBpbmdlbmljLHgxNjAwLW1hYworICAgICAgICAgICAgICAtIGluZ2VuaWMseDE4
MzAtbWFjCisgICAgICAgICAgICAgIC0gaW5nZW5pYyx4MjAwMC1tYWMKICAgICAgICAgICAgICAg
LSBzbnBzLGR3bWFjLTQuMDAKICAgICAgICAgICAgICAgLSBzbnBzLGR3bWFjLTQuMTBhCiAgICAg
ICAgICAgICAgIC0gc25wcyxkd21hYy00LjIwYQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
