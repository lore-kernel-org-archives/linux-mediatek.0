Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11401C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 18:35:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8FF820737
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 18:35:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vPyZhRQk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8FF820737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Mime-Version:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rg0xKboxkhjaOfkCnW43E29jntTU5uOCaVG2HBYcRTg=; b=vPyZhRQkhcSSk+yjzeyjl3d4q
	e6FtZGaOBFUkwJD25AOc6Cb/RZ7wckPoqGsj9leF3Xg+q6U3GGJfe1UrxOZRVMYoHJ4wED/E8/rMc
	wUZhVX1V5kFe6ZVZR45zx+LI9ixPW/bPHWmqch4zrguWZoaIKyaJOSRzvSr8c1OLympESr1NFWb9/
	1bU21/nJalCn1gAxp2+VeCjuGiquXcllww+avbQcMz62zMV9KwXE/0qTBgxnZUltpvE51tmzPG8G/
	z4FrrWMoWQcXcuIfgtWOeEBMqAB/70M5GPR609nzCZY7SlepR1t00DshlkxE50oV8b/Muslw3Fmy/
	J3p55FyPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyg3z-0006xm-8u; Thu, 23 Jul 2020 18:35:27 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=u3832b3a9db3152.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyg3v-0006x8-US; Thu, 23 Jul 2020 18:35:24 +0000
Message-ID: <32af04735eb71f1b035246eedeaa17baae066e79.camel@infradead.org>
Subject: Re: Aw: MT7623 Ethernet TX performance regression
From: David Woodhouse <dwmw2@infradead.org>
To: Frank Wunderlich <frank-w@public-files.de>
Date: Thu, 23 Jul 2020 19:35:21 +0100
In-Reply-To: <trinity-a6706333-e5a5-47d6-bf9d-0881ca9f58ba-1595526555641@3c-app-gmx-bs73>
References: <03da7c5a51c3640110509bdd2a00e4e258b85924.camel@infradead.org>
 <trinity-a6706333-e5a5-47d6-bf9d-0881ca9f58ba-1595526555641@3c-app-gmx-bs73>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: Sean Wang <sean.wang@mediatek.com>, cioby.service@gmail.com,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: multipart/mixed; boundary="===============2998679870120582860=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2998679870120582860==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-tO/BnFtnjI9nY7tvIsGl"


--=-tO/BnFtnjI9nY7tvIsGl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-07-23 at 19:49 +0200, Frank Wunderlich wrote:
> Hi,
>=20
> could you try this? it is the 3rd part of rene's series which got not
> merged to mainline yet.
>=20
> https://github.com/frank-w/BPI-R2-4.14/commit/ff2bb8719bc269a9feb69676415=
9e2640fc64eed

Yes, that's it. Thanks!

That brings the performance on 5.8.0-rc6 back to just under line rate
1Gb/s in both directions for both IPv6 and Legacy IP.

On the OpenWrt 5.4 kernel it's still not quite that for IPv6 TX
(although it is for Legacy IP TX), but at least I can consider that a
"performance" problem instead of basic functionality :)

root@OpenWrt:/# iperf3 -c i7.infradead.org
Connecting to host i7.infradead.org, port 5201
[  5] local 2001:8b0:10b:1::c2a port 52730 connected to 2001:8b0:10b:1:21e:=
67ff:fecb:7a92 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   109 MBytes   916 Mbits/sec  1357   72.5 KBytes   =
   =20
[  5]   1.00-2.00   sec   109 MBytes   913 Mbits/sec  1203   69.7 KBytes   =
   =20
[  5]   2.00-3.00   sec   107 MBytes   899 Mbits/sec  1300   76.7 KBytes   =
   =20
[  5]   3.00-4.00   sec   108 MBytes   906 Mbits/sec  1514   71.1 KBytes   =
   =20
[  5]   4.00-5.00   sec   108 MBytes   903 Mbits/sec  1518   62.8 KBytes   =
   =20
[  5]   5.00-6.00   sec   108 MBytes   909 Mbits/sec  1402   68.3 KBytes   =
   =20
[  5]   6.00-7.00   sec   108 MBytes   905 Mbits/sec  1325   83.7 KBytes   =
   =20
[  5]   7.00-8.00   sec   108 MBytes   903 Mbits/sec  1348   72.5 KBytes   =
   =20
[  5]   8.00-9.00   sec   107 MBytes   900 Mbits/sec  1481   76.7 KBytes   =
   =20
[  5]   9.00-10.00  sec   108 MBytes   904 Mbits/sec  1300   73.9 KBytes   =
   =20
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.05 GBytes   906 Mbits/sec  13748             sen=
der
[  5]   0.00-10.00  sec  1.05 GBytes   905 Mbits/sec                  recei=
ver

iperf Done.
root@OpenWrt:/# iperf3 -c i7.infradead.org -R
Connecting to host i7.infradead.org, port 5201
Reverse mode, remote host i7.infradead.org is sending
[  5] local 2001:8b0:10b:1::c2a port 52734 connected to 2001:8b0:10b:1:21e:=
67ff:fecb:7a92 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  77.3 MBytes   648 Mbits/sec                 =20
[  5]   1.00-2.00   sec  78.1 MBytes   655 Mbits/sec                 =20
[  5]   2.00-3.00   sec  78.3 MBytes   656 Mbits/sec                 =20
[  5]   3.00-4.00   sec  78.6 MBytes   659 Mbits/sec                 =20
[  5]   4.00-5.00   sec  78.2 MBytes   656 Mbits/sec                 =20
[  5]   5.00-6.00   sec  78.2 MBytes   656 Mbits/sec                 =20
[  5]   6.00-7.00   sec  78.4 MBytes   658 Mbits/sec                 =20
[  5]   7.00-8.00   sec  78.7 MBytes   661 Mbits/sec                 =20
[  5]   8.00-9.00   sec  78.1 MBytes   655 Mbits/sec                 =20
[  5]   9.00-10.00  sec  78.3 MBytes   657 Mbits/sec                 =20
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec   784 MBytes   658 Mbits/sec   31             sende=
r
[  5]   0.00-10.00  sec   782 MBytes   656 Mbits/sec                  recei=
ver

iperf Done.
root@OpenWrt:/# iperf3 -c i7.infradead.org -R
Connecting to host i7.infradead.org, port 5201
Reverse mode, remote host i7.infradead.org is sending
[  5] local 2001:8b0:10b:1::c2a port 59138 connected to 2001:8b0:10b:1:21e:=
67ff:fecb:7a92 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec   103 MBytes   865 Mbits/sec                 =20
[  5]   1.00-2.00   sec   105 MBytes   879 Mbits/sec                 =20
[  5]   2.00-3.00   sec   105 MBytes   880 Mbits/sec                 =20
[  5]   3.00-4.00   sec   104 MBytes   876 Mbits/sec                 =20
[  5]   4.00-5.00   sec   105 MBytes   880 Mbits/sec                 =20
[  5]   5.00-6.00   sec   105 MBytes   878 Mbits/sec                 =20
[  5]   6.00-7.00   sec   105 MBytes   879 Mbits/sec                 =20
[  5]   7.00-8.00   sec   105 MBytes   879 Mbits/sec                 =20
[  5]   8.00-9.00   sec   105 MBytes   881 Mbits/sec                 =20
[  5]   9.00-10.00  sec   105 MBytes   880 Mbits/sec                 =20
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.03 GBytes   881 Mbits/sec   81             sende=
r
[  5]   0.00-10.00  sec  1.02 GBytes   878 Mbits/sec                  recei=
ver

iperf Done.



> to which client/server do you make the tests? i had retransmitts like
> you with ubuntu 20.4 default kernel (5.4.0-xx) and fixed it with self
> compiled 5.4.51

Just a standard x86_64 Fedora 32 box.


--=-tO/BnFtnjI9nY7tvIsGl
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCECow
ggUcMIIEBKADAgECAhEA4rtJSHkq7AnpxKUY8ZlYZjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjIwMTAxMjM1
OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRlYWQub3JnMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsv3wObLTCbUA7GJqKj9vHGf+Fa+tpkO+ZRVve9EpNsMsfXhvFpb8
RgL8vD+L133wK6csYoDU7zKiAo92FMUWaY1Hy6HqvVr9oevfTV3xhB5rQO1RHJoAfkvhy+wpjo7Q
cXuzkOpibq2YurVStHAiGqAOMGMXhcVGqPuGhcVcVzVUjsvEzAV9Po9K2rpZ52FE4rDkpDK1pBK+
uOAyOkgIg/cD8Kugav5tyapydeWMZRJQH1vMQ6OVT24CyAn2yXm2NgTQMS1mpzStP2ioPtTnszIQ
Ih7ASVzhV6csHb8Yrkx8mgllOyrt9Y2kWRRJFm/FPRNEurOeNV6lnYAXOymVJwIDAQABo4IB0zCC
Ac8wHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFLfuNf820LvaT4AK
xrGK3EKx1DE7MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNkd213MkBpbmZy
YWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQALbSykFusvvVkSIWttcEeifOGGKs7Wx2f5f45b
nv2ghcxK5URjUvCnJhg+soxOMoQLG6+nbhzzb2rLTdRVGbvjZH0fOOzq0LShq0EXsqnJbbuwJhK+
PnBtqX5O23PMHutP1l88AtVN+Rb72oSvnD+dK6708JqqUx2MAFLMevrhJRXLjKb2Mm+/8XBpEw+B
7DisN4TMlLB/d55WnT9UPNHmQ+3KFL7QrTO8hYExkU849g58Dn3Nw3oCbMUgny81ocrLlB2Z5fFG
Qu1AdNiBA+kg/UxzyJZpFbKfCITd5yX49bOriL692aMVDyqUvh8fP+T99PqorH4cIJP6OxSTdxKM
MIIFHDCCBASgAwIBAgIRAOK7SUh5KuwJ6cSlGPGZWGYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEwMjAwMDAwMFoXDTIyMDEwMTIz
NTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBALL98Dmy0wm1AOxiaio/bxxn/hWvraZDvmUVb3vRKTbDLH14bxaW
/EYC/Lw/i9d98CunLGKA1O8yogKPdhTFFmmNR8uh6r1a/aHr301d8YQea0DtURyaAH5L4cvsKY6O
0HF7s5DqYm6tmLq1UrRwIhqgDjBjF4XFRqj7hoXFXFc1VI7LxMwFfT6PStq6WedhROKw5KQytaQS
vrjgMjpICIP3A/CroGr+bcmqcnXljGUSUB9bzEOjlU9uAsgJ9sl5tjYE0DEtZqc0rT9oqD7U57My
ECIewElc4VenLB2/GK5MfJoJZTsq7fWNpFkUSRZvxT0TRLqznjVepZ2AFzsplScCAwEAAaOCAdMw
ggHPMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBS37jX/NtC72k+A
CsaxitxCsdQxOzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEF
BQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUwKzApBggrBgEFBQcCARYd
aHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
bC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAC20spBbrL71ZEiFrbXBHonzhhirO1sdn+X+O
W579oIXMSuVEY1LwpyYYPrKMTjKECxuvp24c829qy03UVRm742R9Hzjs6tC0oatBF7KpyW27sCYS
vj5wbal+TttzzB7rT9ZfPALVTfkW+9qEr5w/nSuu9PCaqlMdjABSzHr64SUVy4ym9jJvv/FwaRMP
gew4rDeEzJSwf3eeVp0/VDzR5kPtyhS+0K0zvIWBMZFPOPYOfA59zcN6AmzFIJ8vNaHKy5QdmeXx
RkLtQHTYgQPpIP1Mc8iWaRWynwiE3ecl+PWzq4i+vdmjFQ8qlL4fHz/k/fT6qKx+HCCT+jsUk3cS
jDCCBeYwggPOoAMCAQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf
+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcf
WlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqza
aPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDK
CMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAU
u69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8E
RTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29t
b2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
cC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2
SQgG1NgvNc3fQP7TcePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs
0j8CGpfb+SJA3GaBQ+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDM
KVmU/PUWNMKSTvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+
E2pvOUtY+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfH
M5tdhYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1t
yZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAb
R9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA4rtJSHkq7AnpxKUY8ZlYZjANBglghkgB
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAw
NzIzMTgzNTIxWjAvBgkqhkiG9w0BCQQxIgQgEqk6/tFS0VRONYi0qzRsCJUgnKt99SkY6Bi57aND
BIIwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBADmJtthcS9HO+8Mko+n9KzHgQARRBWDZ8FJUahwwE+OsYPUfh8iq0LvZb26bviMs
7HnkYT1U2MccGZfcOe9aJq85nKUi129HuxB1NIGRWisQxsQpwNCIuymKfdZKD+5HdqRndnzGE7lQ
VcF6bU+G30SZfkxtAFCYx0iw456Cv5gX8GANYTvA5c/ySxCobj5kQvp9a2Z7W2CP8HW714LtPd/V
OcgaS9T4Goru2d3KEmAEVcI3+ChhKL2HZJivnuvwiGrA+hwv9IQCdtQib6/A+pqzKxFau8+4bnzv
DQ9sl2H5ERgLGkX0O1eptr9xTtHpVWhou7sTtMn6ninzhjMFFzcAAAAAAAA=


--=-tO/BnFtnjI9nY7tvIsGl--



--===============2998679870120582860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2998679870120582860==--


